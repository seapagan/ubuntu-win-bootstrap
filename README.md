# Bootstrap script for the Windows Subsytem for Linux (WSL)

This is a very simple (for now) script to set up a NEW UNMODIFIED [`Windows Subsytem for Linux`][wsl] (WSL hereafter) with the following functionality :

* Updated to the latest package versions from Ubuntu upstream.
* Have the `build-essential` package installed plus all required support libraries to enable the below functionality to work.
* [`Sublime Text 3`][sublime] Editor installed as standard with `Package Control` and a number of useful packages.
* The Latest version of [`Git`][git] installed.
* The [`Ruby`][ruby] scripting language installed via [`Rbenv`][rbenv] with the current version of Rails installed as standard.
* [`Node.js`][node] both the most recent LTS version and latest stable version via [`NVM`][nvm]
* The [`Python`][python] scripting language both the latest 2.7 and 3.x versions via [`Pyenv`][pyenv]
* Install the latest STABLE [`Perl`][perl] scripting language via [`Perlbrew`][perlbrew] with cpan and cpanm pre-installed and configured. Several PERL modules that make cpan easier are also pre-installed
* Enable resolution of WINS hostnames

Note also since WSL is basically just a standard Ubuntu installation this should work unmodified on an Ubuntu Distribution also.

**Please read all of this file before starting**

## Important
The default setup of WSL is to merge the Windows PATH values into the Linux path. However this can lead to problems and contamination. for example if you have comparable tools installed under native Windows (Perl Python Ruby Node NVM etc) then they could conflict with or bypass the WSL Linux equivalents __even causing the bootstrap script to fail__.  
Personally I want the WSL to be a completely isolated system that will not have any Windows artifacts - for a start it makes the PATH variable a great deal shorter and easier to troubleshoot!! To this result there is a Windows registry file `no-windows-path.reg` in the repository that sets a simple registry flag to stop this behavior. After that flag is set the only PATH strings __under WSL__ will be those required by Linux. Note that this will __not__ affect your Windows PATH in any way.
The contents of the file `no-windows-path.reg` are :

```
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss]
AppendNtPath=dword:00000000
```
If you uninstall and reinstall WSL for any reason you will need to reapply the above Registry file.

## Usage
The simplest way to use this script is to clone into a completely new WSL environment. If you already have a configured WSL system there are instructions below on how to reset this to 'factory' defaults __[TODO]__.  
From within WSL run the following:
```
git clone https://github.com/seapagan/ubuntu-win-bootstrap.git
cd ubuntu-win-bootstrap
./bootstrap.sh
```
## X-Server
To use the included version of `Sublime Text` we need to have an X-Server installed on the native Windows (not WSL) system. I'd recommend installing [`VcXsrv`][vcxsrv]. This is a straightforward install and then run the `XLaunch` utility leaving everything at the default settings. We already set the `DISPLAY` variable in WSL to point to this as part of the bootstrap.  
Once that is installed and running you will be able to use any other X-Window based programs you wish to install - it is even possible to have the full UBUNTU graphical desktop running if that is your desire.

## Sublime Text 3
The bootstrap script will automatically install Sublime Text 3 with `Package Control` and a number of useful packages. These will properly be installed during the first run on Sublime Text. I recommend you run Sublime the first time wait a few seconds them close. Open it a second time and the packages will then be installed. It may take a few minutes for the packages start installing so try not to close the program too soon.

#### Packages installed are :
* All Autocomplete
* Babel
* Color Highlighter
* DocBlockr
* Emmet
* ExportHtml
* Git
* GitGutter
* HexViewer
* Markdown Preview
* MarkdownEditing
* Package Control
* SassBeautify
* SideBarEnhancements
* SublimeCodeIntel
* SublimeLinter
* SublimeREPL
* Terminal
* TrailingSpaces

If you have a License for Sublime Text, copy that from your email into a file `support/License.sublime_license` before running the Bootstrap script, and it wil be properly installed to Sublime for you.

## To-Do
* More robust fall-over on already configured systems. If Rbenv etc are already installed then ignore installing that part
* split each diferent section out to it's own file for clarity

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

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
[vcxsrv]: https://sourceforge.net/projects/vcxsrv/
