import re
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import caps_widget
from gruvbox.gruvbox import *
from theme import *

#######################################
############ DEFAULTS #################  
#######################################

mod = "mod4"
terminal = "kitty"
triangle = "◀"
slash = ""
separator = slash

#######################################
############# KEYMAPS #################
#######################################

# fmt: off
keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "w", lazy.spawn("google-chrome-stable"), desc="Launch Chrome"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "c", lazy.spawn("flameshot gui"), desc="Screenshot tool"),
    Key([mod], "equal", lazy.spawn("pamixer -i 5"), desc="Volume +"),
    Key([mod], "minus", lazy.spawn("pamixer -d 5"), desc="Volume -"),
    Key([mod], "m", lazy.spawn("pamixer -t"), desc="Volume -"),
    Key([mod], "p", lazy.spawn("rofi -modi drun,run -show drun -font 'Comic Code Ligatures 17' -show-icons"), desc="Prompts rofi"),
    Key([mod], "s", lazy.spawn("rofi -show p -modi p:rofi-power-menu -font 'Comic Code Ligatures 16' -width 10 -lines 3"), desc="Prompts powermenu"),
    Key([mod], "o", lazy.layout.maximize()),
    Key([mod, "shift"], "space", lazy.layout.flip()),
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "u", lazy.layout.shrink()),
]
# fmt: on

#######################################
############## GROUPS #################  
#######################################

groups = []
group_names = "1234567890"
group_labels = "1234567890"
for i in range(len(group_names)):
    groups.append(Group(name=group_names[i], label=group_labels[i]))

for i in groups:
    keys.extend(
        [
            Key([mod], i.name, lazy.group[i.name].toscreen()),
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
        ]
    )

#######################################
############# LAYOUTS #################
#######################################

default_layout_options = dict(
    border_focus="#458588",
    border_normal="#665c54",
    border_width=3,
    margin=2,
    margin_on_single=0,
)

monadtall_options = dict(
    border_focus="#458588",
    border_normal="#665c54",
    border_width=3,
    margin=3,
    single_border_width=0,
    single_margin=0,
    ratio=0.5
)

layouts = [
    layout.MonadTall(**monadtall_options),
    layout.Columns(**default_layout_options),
    layout.MonadThreeCol(**default_layout_options),
    layout.Max(),
]

#######################################
############# WIDGETS #################
#######################################

widget_defaults = dict(
    font="Comic Code Ligatures",
    fontsize=16,
    padding=5,
    foreground=foreground,
    background=background,
)
extension_defaults = widget_defaults.copy()

#######################################
############# SCREENS #################
#######################################

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    background=blue,
                ),
                widget.GroupBox(
                    disable_drag=True,
                    spacing=0,
                    center_aligned=True,
                    active=active,
                    inactive=inactive,
                    highlight_method="block",
                    this_current_screen_border=mark,
                    urgent_border=warning,
                ),
                widget.WindowName(
                    foreground=background,
                ),
                widget.TextBox(
                    padding=0,
                    text=separator,
                    background=background,
                    foreground=green,
                ),
                caps_widget.CapsNumLockIndicator(
                    background=green, foreground=white0, update_interval=0.1
                ),
                widget.TextBox(
                    padding=0,
                    text=separator,
                    foreground=yellow,
                    background=green,
                ),
                widget.TextBox(
                    text="",
                    background=yellow,
                    foreground=white0,
                ),
                widget.PulseVolume(
                    background=yellow, foreground=white0, update_interval=0.1
                ),
                widget.TextBox(
                    padding=0,
                    text=separator,
                    foreground=blue,
                    background=yellow,
                ),
                widget.Clock(
                    # format='%I:%M %p',
                    format="%d.%m",
                    background=blue,
                    foreground=white0,
                ),
                widget.TextBox(
                    padding=0,
                    text=separator,
                    foreground=purple,
                    background=blue,
                ),
                widget.Clock(
                    # format='%d.%m.%Y',
                    format="%H:%M",
                    background=purple,
                    foreground=white0,
                ),
                widget.Systray(
                    background=purple,
                    icon_size=15,
                ),
            ],
            20,
        ),
    ),
]

#######################################
############# FLOATING ################
#######################################

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(wm_class="pinentry-gtk-2"),  # GPG key password entry
        Match(wm_class="flameshot"),
        Match(title=re.compile('^Steam - News.*$')),
    ]
)

#######################################
################ MISC #################
#######################################

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"
