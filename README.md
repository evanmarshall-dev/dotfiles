# DOTFILES NOTES

## Setup Development Environment

## Git

### Cheat Sheet

#### Cloning

- **Basic Clone**: `git clone https://github.com/<username>/<repository-name>.git`.
- This command clones the repository into a folder named "my-project" instead of using the repository name. This is useful when you want to organize your projects differently or when the repository name is too long or unclear: `git clone https://github.com/<username>/<repository-name>.git my-project`.
- **Specific Branch**: `git clone -b <branch-name> https://github.com/<username>/<repository-name>.git`.

#### Initialization

- Transforms your current directory into a Git repository by creating a hidden `.git` folder that stores all the metadata and version history. It's the first command you use when starting a new project from scratch: `git init`.

#### Adding to Staging

- This tells Git to track changes to the specified file and include those changes in the next commit: `git add filename.js`.
- This command stages all modified and new files in the current directory (and subdirectories) for the next commit. The dot represents the current directory. This is probably one of the most commonly used Git commands in daily development: `git add .`.
- Sometimes you need to add files that are listed in your `.gitignore`. Using the `-f` (force) flag overrides the ignore rules, allowing you to stage files that would normally be excluded. Use with caution - there's usually a good reason why files are gitignored: `git add -f file.log`.

#### Committing

- This creates a new commit with all the staged changes. The `-m` flag allows you to add a descriptive message that explains what changes were made. Always write clear, concise commit messages that future you (and others) will understand: `git commit -m "<Add user authentication feature>"`.
- Forgot to include a file or made a typo in your commit message? This command lets you modify your most recent commit instead of creating a new one. It adds any staged changes to the previous commit and allows you to update the commit message: `git commit --amend`.

#### Status

- This command shows you exactly what's happening in your working directory - which files are modified, staged, or untracked: `git status`.
- Get a condensed view of your repository status with the `-s` (short) flag. Each file is displayed with a two-letter code: `M` for modified, `A` for added, `??` for untracked, and so on. Perfect when you need a quick overview without the verbose explanation: `git status -s`.
- Combining the `-s` (short) and `-b` (branch) flags gives you a compact status view that also shows your current branch and its relationship to the remote. This is especially useful when working with multiple branches and remote repositories: `git status -sb`.

#### Logs, History, and Changes

- This displays a chronological list of commits, with the most recent ones at the top. Each entry includes the commit hash, author, date, and commit message. It's your project's timeline, showing how it evolved over time: `git log`.
- This shows the exact line-by-line changes you've made to files that haven't been staged yet. Added lines are prefixed with `+` and shown in green, while removed lines are prefixed with `-` and shown in red. This helps you review changes before staging them: `git diff`.
- Similar to git diff, but this shows changes that have been staged (added to the index) but not yet committed. It's a final review before committing to make sure you're including exactly what you intend to: `git diff --staged`.

#### Remotes

- List of remote names with their URLs for both fetch and push operations. The `-v` flag stands for "verbose", showing both the remote names and their URLs: `git remote -v`.
- This connects your local repository to a remote repository, giving it the name "origin" (the conventional name for the primary remote). You can use any name instead of "origin" if you're working with multiple remotes: `git remote add origin https://github.com/<username>/<repository-name>.git`.
- This updates the URL for an existing remote. Useful when a repository has been renamed or transferred to a different account, or when switching between HTTPS and SSH protocols for authentication: `git remote set-url origin https://github.com/<username>/<new-repo-name>.git`.

#### Branches

- This command updates your working directory to match the specified branch. All your files will change to reflect the state of that branch. Make sure to commit or stash changes before switching branches to avoid losing work: `git checkout <feature-branch>`.
- This is a time-saver that combines two operations: creating a new branch and switching to it. The new branch starts from your current position (HEAD): `git checkout -b <new-feature>`.

#### Discard

- This discards all unstaged changes in your working directory, reverting files back to the state they were in at the last commit. Be careful with this command - the changes will be permanently lost! Consider using git stash if you might need the changes later: `git checkout -- .`.
- This command discards changes to a specific file, restoring it to the state it was in at the last commit. It's safer than discarding all changes when you only want to reset one file while keeping modifications to others: `git checkout -- <filename.js>`.

#### Push

- This uploads your local commits on the main branch to the remote repository named origin. It's how you share your changes with others or back up your work to the remote server. Replace "main" with any branch name you want to push: `git push origin <main>`.
- When pushing a new branch for the first time, the `-u` (or `--set-upstream`) flag establishes a tracking relationship between your local and remote branch. This allows you to use git pull and git push without specifying the remote and branch in future operations: `git push -u origin <feature-branch>`.
- Overwrites remote branch history with your local version. This can erase commits on the remote! Use with extreme caution. The `-f` flag stands for "force." Only use this when absolutely necessary and you understand the consequences: `git push -f origin <main>`.

#### Deletion

- This removes a branch from the remote repository after you're done with it. Typically used when a feature is complete and merged, or when cleaning up abandoned work. Note that this doesn't remove the local branch: `git push origin --delete <feature-branch>`.
- This removes a branch from your local repository. Git will prevent deletion if the branch contains unmerged changes, protecting you from accidentally losing work. This is good practice for keeping your repository clean after feature work is completed: `git branch -d <feature-branch>`.
- Deletes a local branch regardless of its merge status. When you want to discard a branch with unmerged changes. The `-D` flag forces deletion even if the branch contains unmerged changes. Use when you want to completely abandon work on a branch: `git branch -D <feature-branch>`.
- This removes all untracked files (`-f`) and directories (`-d`) from your working directory. It's like a "hard reset" for your working directory, leaving only tracked files. Use this to clean up generated files, build artifacts, or when switching to a completely different part of the project: `git clean -fd`.

#### Merging

- This integrates changes from the specified branch into your current branch. Git automatically creates a merge commit if both branches have diverged: `git merge <feature-branch>`.
- This fetches the latest changes from the remote repository's main branch and automatically merges them into your current local branch. It's essentially a combination of git fetch followed by git merge, synchronizing your local copy with the remote version: `git pull origin <main>`.
- This command resets all tracked files to match the most recent commit, discarding any changes that haven't been committed yet. Your working directory will be clean, exactly matching the last commit. Use with caution as this will permanently discard uncommitted changes: `git reset --hard`.
- Need to switch branches but not ready to commit? This command temporarily saves your modified tracked files, removing them from your working directory. You can later reapply these changes with `git stash pop` when you're ready to continue working: `git stash`.
- When working on a feature branch, this command applies all your branch's commits on top of the specified branch's latest commit. It creates a cleaner, more linear project history compared to merging. Use this to incorporate the latest changes from main into your feature branch: `git rebase main`.
