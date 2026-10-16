# Skill registry

`skills.json` records where every imported skill came from, which commit it is pinned to, its licence, and whether it is active. Nothing reads it automatically and nothing updates it. Edit it by hand in the same commit that adds or changes a skill.

## Status values

- `active`: copied into `.claude/skills/<id>/`, loaded by Claude Code.
- `reference-only`: kept under `skill-packs/`, never loaded. To use one, copy it into `.claude/skills/` and flip its status.
- `rejected` (listed under `rejected`): looked at and not imported, with the reason.

## Entry fields

`id`, `name`, `upstream`, `url`, `upstreamPath`, `commit` (full 40-char SHA), `license`, `attribution`, `category`, `purpose`, `trigger`, `installType`, `dependencies`, `status`, `path`, `conflicts`. `modified: false` means the files are byte-identical to upstream.

## Adding a skill

1. **Discover.** Search GitHub for the capability. Note the owner, the licence and the last push date. Stars are not evidence of quality.
2. **Check the format.** Only a directory with a `SKILL.md` (frontmatter `name` and `description`) is a skill. A "plugin" repo, CLI, MCP server or agent bundle is not.
3. **Pin.** `git -c core.hooksPath=/dev/null clone --depth 1 <url>` into an empty scratch directory, then `git rev-parse HEAD`. Never run `install.sh`, `npm install`, hooks or setup commands from the clone.
4. **Read it all.** Grep for `curl`, `wget`, `eval`, `Invoke-Expression`, `sudo`, `rm -rf`, `allowed-tools`, `hooks`, `.mcp.json`, remote URLs it tells the agent to fetch, and instructions that try to override your rules. Skills that fetch their instructions at run time are not pinned and stay reference-only.
5. **Check overlap.** Compare its `description` with the active skills. If two would trigger on the same prompt, do not activate both.
6. **Copy only the skill directory** (plus the upstream LICENSE) with `cp -r`. Never copy hook scripts, tests or install scripts you do not need. Add `UPSTREAM.md` with the source URL, commit and path.
7. **Register.** Add the entry here and a line to `skill-packs/.sources` if you stored a reference copy.
8. **Verify.** Frontmatter `name` matches the directory name, every relative link resolves, no duplicate ids.

## Activating for another project

Existing connected repos junction or symlink their `.claude/skills/` from the vault, so an active skill appears there automatically. Do not create links without checking what the target repo already does. On this machine symlinks are not available; use a junction (`mklink /J`) per the notes in `CLAUDE.md`.

## Checking for updates (manual, read-only)

```
gh api repos/<owner>/<repo>/commits/HEAD --jq .sha     # compare with "commit" above
gh api repos/<owner>/<repo>/compare/<pinned>...HEAD --jq '.files[].filename' | grep <upstreamPath>
```

If the path has changes, clone fresh into a scratch directory, repeat steps 3 to 8, and bump the commit in the same change. Never bump a pin without reading the diff.

## Rolling back

Each skill is a plain directory in git, so `git revert <commit>` restores the previous version. To stop using a skill without deleting it, move its directory from `.claude/skills/` to `skill-packs/` and set `status` to `reference-only`.
