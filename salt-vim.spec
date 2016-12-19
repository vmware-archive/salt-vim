Name:		salt-vim
Version:	0.0.1
Release:	1%{?dist}
Summary:	Vim files for working on Salt files

Group:		Applications/Editors
License:	ASL 2.0
URL:		https://github.com/saltstack/salt-vim
Source0:	https://github.com/saltstack/salt-vim/archive/master.tar.gz

Requires:	vim >= 7

%description
Vim files for working on Salt files

%prep
%setup -q -n salt-vim-master

%build

%install
mkdir -p %{buildroot}%{_defaultlicensedir}/%{name}-%{version}
mkdir -p %{buildroot}%{_datarootdir}/vim/vimfiles/{syntax,ftdetect,ftplugin}
cp syntax/sls.vim %{buildroot}%{_datarootdir}/vim/vimfiles/syntax/
cp ftdetect/sls.vim %{buildroot}%{_datarootdir}/vim/vimfiles/ftdetect/
cp ftplugin/sls.vim %{buildroot}%{_datarootdir}/vim/vimfiles/ftplugin/
cp LICENSE %{buildroot}%{_defaultlicensedir}/%{name}-%{version}

%files
%{_datarootdir}/vim/vimfiles/syntax/sls.vim
%{_datarootdir}/vim/vimfiles/ftdetect/sls.vim
%{_datarootdir}/vim/vimfiles/ftplugin/sls.vim
%{_defaultlicensedir}/%{name}-%{version}/LICENSE
%doc



%changelog
* Mon Dec 19 2016 Kai Meyer <kai@gnukai.com> - 0.0.1-1
- Initial RPM spec


