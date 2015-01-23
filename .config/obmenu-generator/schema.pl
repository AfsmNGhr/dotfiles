##!/usr/bin/perl
##
## SCHEMA supports the following keys: item, cat, begin_cat, end_cat,
##                                     exit, raw, sep, obgenmenu
##
## Modified by Carl Duff.

=for comment

item: add an item into the menu
{item => ["command", "label", "icon"]}

cat: add a category into the menu
{cat => ["name", "label", "icon"]}

begin_cat: begin of a category
{begin_cat => ["name", "icon"]}

end_cat: end of a category
{end_cat => undef}

sep: menu line separator
{sep => undef} or {sep => "label"}

exit: default "Exit" action
{exit => ["label", "icon"]}

raw: any valid Openbox XML string
{raw => q(xml string)},

obgenmenu: category provided by obmenu-generator
{obgenmenu => "label"}

scripts: executable scripts from a directory
{scripts => ["/my/dir", BOOL, "icon"]}
BOOL - can be either true or false (1 or 0)
0 == open the script in background
1 == open the script in a new terminal

wine_apps: windows applications installed via wine
{wine_apps => ["label", "icon"]}

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to a icon or a valid icon name
#    * By default, category names are case insensitive. (e.g.: X-XFCE == x_xfce)

require '/home/afsmnghr/.config/obmenu-generator/config.pl';

our $SCHEMA = [
#             COMMAND                 	LABEL          		ICON
   {item => ['thunar',      		'Thunar','thunar']},
   {item => ['terminator',   	 	'Terminator','terminator']},
   {item => ['gnome-screenshot --interactive',  'Screenshot','gnome-screenshot']},
   # {item => ['nitrogen',   	 	'Nitrogen','nitrogen']},
   {sep => undef},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education',   'Education',   'applications-science']},
    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Office',      'applications-office']},
    {cat => ['settings',    'Settings',    'applications-accessories']},

## Custom "Advanced Menu"

   {begin_cat => ['Advanced Settings',  'gnome-settings']},
   {begin_cat => ['Desktop and Login',  '/usr/share/icons/Faenza/apps/48/dconf-editor.png']},
   {item => ['emacsclient -c -F "((fullscreen . fullscreen))" ~/.config/tint2/tint2rc','Tint2 Panel','emacs']},
   {item => ['emacsclient -c -F "((fullscreen . fullscreen))" /etc/slim.conf','Slim Configuration','emacs']},
   {item => ['emacsclient -c -F "((fullscreen . fullscreen))" ~/.xinitrc','.xinitrc','emacs']},
   {item => ['emacsclient -c -F "((fullscreen . fullscreen))" ~/.xprofile','.xprofile','emacs']},
   {end_cat   => undef},
   {begin_cat => ['Obmenu-Generator', '/usr/share/icons/Faenza/apps/48/menu-editor.png']},
		{item => ['emacsclient -c -F "((fullscreen . fullscreen))" ~/.config/obmenu-generator/schema.pl','Pipe Menu Schema','emacs']},
		{item => ['emacsclient -c -F "((fullscreen . fullscreen))" ~/.config/obmenu-generator/config.pl','Pipe Menu Config','emacs']},
		{item => ['obmenu-generator -d','Refresh Icon Set','/usr/share/icons/Faenza/apps/48/application-default-icon.png']},
   {end_cat   => undef},
   {begin_cat => ['Openbox',  'openbox']},
		{item => ['openbox --reconfigure','Reconfigure Openbox','openbox']},
		{item => ['emacsclient -c -F "((fullscreen . fullscreen))" ~/.config/openbox/autostart','Openbox Autostart','emacs']},
		{item => ['emacsclient -c -F "((fullscreen . fullscreen))" ~/.config/openbox/rc.xml','Openbox RC','emacs']},
		{item => ['emacsclient -c -F "((fullscreen . fullscreen))" ~/.config/openbox/menu.xml','Openbox Menu','emacs']},
		{item => ['emacsclient -c -F "((fullscreen . fullscreen))" /etc/oblogout.conf','Openbox Logout','emacs']},
   {end_cat   => undef},
   {begin_cat => ['Pacman / Servers', '/usr/share/icons/Faenza/apps/48/package-manager-icon.png']},
		{item => ['terminator -x sudo ~/.config/executables/change-repo.sh','Switch stable, testing and unstable repos','terminator']},
		{item => ['emacsclient -c -F "((fullscreen . fullscreen))" /etc/pacman.conf','Pacman Config','emacs']},
		{item => ['emacsclient -c -F "((fullscreen . fullscreen))" /etc/pacman.d/mirrorlist','Pacman Mirrorlist','emacs']},
   {end_cat   => undef},
   {end_cat   => undef},

## Back to standard pipe-menu

   {cat => ['system',      'System',      'applications-system']},
   {sep => undef},


## Use Oblogout script instead of simple exit command

   {item => ['xlock -mode blank', 'Lock Screen', 'lock']},
   {item => ['oblogout',        'Logout...',      'exit']},

    #{cat => ['qt',          'QT Applications',    'qtlogo']},
    #{cat => ['gtk',         'GTK Applications',   'gnome-applications']},
    #{cat => ['x_xfce',      'XFCE Applications',  'applications-other']},
    #{cat => ['gnome',       'GNOME Applications', 'gnome-applications']},
    #{cat => ['consoleonly', 'CLI Applications',   'applications-utilities']},

    #                  LABEL             ICON
    #{wine_apps => ['Wine apps', 'applications-other']},

]
