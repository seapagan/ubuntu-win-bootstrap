# Bootstrap script for the Windows Subsytem for Linux (WSL)

This is a very simple (for now) script to set up a NEW UNMODIFIED [`Windows Subsytem for Linux`][wsl] (WSL hereafter) with the following functionality :

* Updated to the latest package versions from Ubuntu upstream.
* Have the `build-essential` package installed, plus all required support libraries to enable the below functionality to work.
* [`Sublime Text 3`][sublime] Editor installed as standard.
* The Latest version of [`Git`][git] installed.
* The [`Ruby`][ruby] scripting language installed via [`Rbenv`][rbenv], with the current version of Rails installed as standard.
* [`Node.js`][node], both the most recent LTS version and latest stable version via [`NVM`][nvm]
* The [`Python`][python] scripting language, both the latest 2.7 and 3.x versions via [`Pyenv`][pyenv]
* The [`Perl`][perl] scripting language via [`Perlbrew`][perlbrew] with cpan and cpanm preinstalled

Note also, since WSL is basically just a standard Ubuntu installation, this should work unmodified on an Ubuntu Distribution also.

## Important
The default setup of WSL is to merge the Windows PATH values into the Linux path under WSL. However, this can lead to problems and contamination. for example if you have comparable tools installed under native Windows (Perl, Python, Ruby, Node, NVM etc) then they could conflict with or bypass the WSL Linux equivalents __even causing the bootstrap script to fail__.
Personally, I want the WSL to be a completely isolated system that will not have any Windows artifact - for a start it makes the PATH variable a great deal shorter and easier to troubleshoot!! To this result, there is a Windows registry file `no-windows-path.reg` in the repository that sets a simple registry flag to stop this behavior. After that flag is set, the only PATH strings __under WSL__ will be those required by Linux. Note that this will __not__ affect your Windows PATH in any way.
The contents of the file `no-windows-path.reg` are :

```
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss]
"AppendNtPath"=dword:00000000
```
[wsl]: https://msdn.microsoft.com/commandline/wsl/about
[sublime]: https://www.sublimetext.com/
[git]: https://git-scm.com
[ruby]: https://www.ruby-lang.org
[rbenv]: https://github.com/rbenv/rbenv
[node]: https://nodejs.org
[nvm]: https://github.com/creationix/nvm
[python]: https://www.python.org/
[pyenv]: https://github.com/pyenv/pyenv
[perl]: https://www.perl.org/
[perlbrew]: https://perlbrew.pl/