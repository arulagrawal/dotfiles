[global]
    frame_width = 1
    frame_color = "#2E3440"
    
    font = Iosevka Bold 10
    
    # Allow a small subset of html markup:
    #   <b>bold</b>
    #   <i>italic</i>
    #   <s>strikethrough</s>
    #   <u>underline</u>
    # 
    # For a complete reference see
    # <http://developer.gnome.org/pango/stable/PangoMarkupFormat.html>.
    # If markup is not allowed, those tags will be stripped out of the
    # message.
    markup = yes
    
    # The format of the message.  Possible variables are:
    #   %a  appname
    #   %s  summary
    #   %b  body
    #   %i  iconname (including its path)
    #   %I  iconname (without its path)
    #   %p  progress value if set ([  0%] to [100%]) or nothing
    # Markup is allowed
    format = "%s %p\n%b"
    
    # Sort messages by urgency.
    sort = yes
    
    # Show how many messages are currently hidden (because of geometry).
    indicate_hidden = yes
    
    # Alignment of message text.
    # Possible values are "left", "center" and "right".
    alignment = left
    
    # The frequency with wich text that is longer than the notification
    # window allows bounces back and forth.
    # This option conflicts with "word_wrap".
    # Set to 0 to disable.
    bounce_freq = 8

    
    # Show age of message if message is older than show_age_threshold
    # seconds.
    # Set to -1 to disable.
    show_age_threshold = 60
    
    # Split notifications into multiple lines if they don't fit into
    # geometry.
    word_wrap = yes
    
    # Ignore newlines '\n' in notifications.
    ignore_newline = no
    
    
    # The geometry of the window:
    #   [{width}]x{height}[+/-{x}+/-{y}]
    # The geometry of the message window.
    # The height is measured in number of notifications everything else
    # in pixels.  If the width is omitted but the height is given
    # ("-geometry x2"), the message window expands over the whole screen
    # (dmenu-like).  If width is 0, the window expands to the longest
    # message displayed.  A positive x is measured from the left, a
    # negative from the right side of the screen.  Y is measured from
    # the top and down respectevly.
    # The width can be negative.  In this case the actual width is the
    # screen width minus the width defined in within the geometry option.
    geometry = "450x4-7+47"
    
    # Shrink window if it's smaller than the width.  Will be ignored if
    # width is 0.
    shrink = yes
    
    # The transparency of the window.  Range: [0; 100].
    # This option will only work if a compositing windowmanager is
    # present (e.g. xcompmgr, compiz, etc.).
    transparency = 0
    
    # Don't remove messages, if the user is idle (no mouse or keyboard input)
    # for longer than idle_threshold seconds.
    # Set to 0 to disable.
    # default 120
    idle_threshold = 120 
    
    # Which monitor should the notifications be displayed on.
    monitor = 0
    
    # Display notification on focused monitor.  Possible modes are:
    #   mouse: follow mouse pointer
    #   keyboard: follow window with keyboard focus
    #   none: don't follow anything
    # 
    # "keyboard" needs a windowmanager that exports the
    # _NET_ACTIVE_WINDOW property.
    # This should be the case for almost all modern windowmanagers.
    # 
    # If this option is set to mouse or keyboard, the monitor option
    # will be ignored.
    follow = mouse
    
    # Should a notification popped up from history be sticky or timeout
    # as if it would normally do.
    sticky_history = yes
    
    # Maximum amount of notifications kept in history
    history_length = 20
    
    # Display indicators for URLs (U) and actions (A).
    show_indicators = yes
    
    # The height of a single line.  If the height is smaller than the
    # font height, it will get raised to the font height.
    # This adds empty space above and under the text.
    line_height = 0
    
    # Draw a line of "separator_height" pixel height between two
    # notifications.
    # Set to 0 to disable.
    separator_height = 1
    
    # Padding between text and separator.
    # padding = 8
    padding = 8
    
    # Horizontal padding.
    horizontal_padding = 10
    
    # Define a color for the separator.
    # possible values are:
    #  * auto: dunst tries to find a color fitting to the background = "#000000"
    #  * foreground = "#F8F8F2"
    #  * frame: use the same color as the frame;
    #  * anything else will be interpreted as a X color.
    #separator_color = #263238
    separator_color = #767676
    
    # Print a notification on startup.
    # This is mainly for error detection, since dbus (re-)starts dunst
    # automatically after a crash.
    startup_notification = true
    
    # dmenu path.
    dmenu = /usr/bin/dmenu -p dunst:
    
    # Browser for opening urls in context menu.
    browser = /usr/bin/firefox -new-tab

    # Align icons left/right/off
    icon_position = left

    # Paths to default icons.
    icon_path = /usr/share/icons/Papirus-Adapta-Nokto/16x16/status/:/usr/share/icons/Papirus-Apdata-Nokto/16x16/devices/

    # Limit icons size.
    max_icon_size=64

[shortcuts]

    # Shortcuts are specified as [modifier+][modifier+]...key
    # Available modifiers are "ctrl", "mod1" (the alt-key), "mod2",
    # "mod3" and "mod4" (windows-key).
    # Xev might be helpful to find names for keys.
    
    # Close notification.
    close = mod1+space
    
    # Close all notifications.
    # close_all = ctrl+shift+space
    close_all = ctrl+mod1+space

    # Redisplay last message(s).
    # On the US keyboard layout "grave" is normally above TAB and left
    # of "1".
    history = ctrl+shift+- 
    
    # Context menu.
    context = ctrl+mod1+c

[urgency_low]
    # IMPORTANT: colors have to be defined in quotation marks.
    # Otherwise the "#" and following would be interpreted as a comment.
    background = "#000000"
    foreground = "#F8F8F2"
    frame_color = "#767676"
    timeout = 4

[urgency_normal]
    background = "#000000"
    foreground = "#F8F8F2"
    frame_color = "#767676"
    timeout = 8

[urgency_critical]
    background = "#000000"
    foreground = "#F8F8F2"
    frame_color = "#767676"
    timeout = 8


# Every section that isn't one of the above is interpreted as a rules to
# override settings for certain messages.
# Messages can be matched by "appname", "summary", "body", "icon", "category",
# "msg_urgency" and you can override the "timeout", "urgency", "foreground = "#F8F8F2"
# "background = "#000000"
# Shell-like globbing will get expanded.
#
# SCRIPTING
# You can specify a script that gets run when the rule matches by
# setting the "script" option.
# The script will be called as follows:
#   script appname summary body icon urgency
# where urgency can be "LOW", "NORMAL" or "CRITICAL".
# 
# NOTE: if you don't want a notification to be displayed, set the format
# to "".
# NOTE: It might be helpful to run dunst -print in a terminal in order
# to find fitting options for rules.

#[espeak]
#    summary = "*"
#    script = dunst_espeak.sh

#[script-test]
#    summary = "*script*"
#    script = dunst_test.sh

#[ignore]
#    # This notification will not be displayed
#    summary = "foobar"
#    format = ""

#[signed_on]
#    appname = Pidgin
#    summary = "*signed on*"
#    urgency = low
#
#[signed_off]
#    appname = Pidgin
#    summary = *signed off*
#    urgency = low
#
#[says]
#    appname = Pidgin
#    summary = *says*
#    urgency = critical
#
#[twitter]
#    appname = Pidgin
#    summary = *twitter.com*
#    urgency = normal
#
#[Claws Mail]
#    appname = claws-mail
#    category = email.arrived
#    urgency = normal
#    background = "#000000"
#    foreground = "#F8F8F2"
#
#[mute.sh]
#     appname = mute
#     category = mute.sound
#     script = mute.sh
#
#[JDownloader]
#    appname = JDownloader
#    category = JD
#    background = "#000000"
#    foreground = "#F8F8F2"
#
#[newsbeuter]
#    summary = *Feeds*
#    background = "#000000"
#    foreground = "#F8F8F2"
#

[telegram]
    appname = telegram
    urgency = normal
    background = "#000000"
    foreground = "#F8F8F2"

#[irc]
#        appname = weechat
#        timeout = 0
#        background = "#000000"
#        foreground = "#F8F8F2"
#
#[weechat hl]
#     appname = weechat
#     category = weechat.HL
#     background = "#000000"
#     foreground = "#F8F8F2"
#
#[weechat pn]
#     appname = weechat
#     category = weechat.PM
#     background = "#000000"
#     foreground = "#F8F8F2"
#
#[CMUS]
#    appname = CMUS
#    category = cmus
#    background = "#000000"
#    foreground = "#F8F8F2"
#
#
#     background = "#000000"
#     foreground = "#F8F8F2"
#
# vim: ft=cfg

[ncmpcpp]
    appname = ncmpcpp
    urgency = normal
    background = "#000000"
    foreground = "#F8F8F2"
