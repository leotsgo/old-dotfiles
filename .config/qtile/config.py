import re
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from catppuccin_macchiato import *

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
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "w", lazy.spawn("firefox"), desc="Launch Chrome"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "c", lazy.spawn("flameshot gui"), desc="Screenshot tool"),
    Key([mod], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"), desc="Volume +"),
    Key([mod], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"), desc="Volume -"),
    Key([mod], "m", lazy.spawn("pamixer -t"), desc="Volume -"),
    Key([mod], "p", lazy.spawn("rofi -modi drun,run -show drun -font 'Comic Code Ligatures 17' -show-icons"), desc="Prompts rofi"),
    Key([mod], "s", lazy.spawn("rofi -show p -modi p:rofi-power-menu -font 'Comic Code Ligatures 16' -width 10 -lines 3"), desc="Prompts powermenu"),
    Key([mod], "a", lazy.spawn("kitty spotify_player"), desc="Spotify"),
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
    border_focus=green,
    border_normal="#665c54",
    border_width=3,
    margin=4,
    margin_on_single=0,
)

monadtall_options = dict(
    border_focus=green,
    border_normal="#665c54",
    border_width=3,
    margin=4,
    single_border_width=0,
    single_margin=0,
    ratio=0.5,
)

layouts = [
    layout.Columns(**default_layout_options),
    layout.MonadThreeCol(**default_layout_options),
    layout.MonadTall(**monadtall_options),
    layout.Max(),
]

#######################################
############# WIDGETS #################
#######################################

widget_defaults = dict(
    font="Source Code Pro",
    fontsize=16,
    padding=5,
    foreground=subtext_1,
    background=base,
)
extension_defaults = widget_defaults.copy()

#######################################
############# SCREENS #################
#######################################

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    background=lavender,
                ),
                widget.GroupBox(
                    disable_drag=True,
                    spacing=0,
                    center_aligned=True,
                    active=text,
                    inactive=base,
                    highlight_method="line",
                    highlight_color=[base, base],
                    this_current_screen_border=lavender,
                    urgent_border=red,
                ),
                widget.Spacer(),
                widget.WindowName(
                    foreground=text,
                ),
                widget.Spacer(),
                # widget.TextBox(
                #     padding=0,
                #     text=separator,
                #     background=base,
                #     foreground=green,
                # ),
                widget.TextBox(
                    text="",
                    background=green,
                    foreground=crust,
                ),
                widget.PulseVolume(
                    background=green, foreground=crust, update_interval=0.01
                ),
                # widget.TextBox(
                #     padding=0,
                #     text=separator,
                #     foreground=teal,
                #     background=green,
                # ),
                widget.Clock(
                    # format='%I:%M %p',
                    format=" %A | %d/%m ",
                    background=teal,
                    foreground=crust,
                ),
                # widget.TextBox(
                #     padding=0,
                #     text=separator,
                #     foreground=sapphire,
                #     background=teal,
                # ),
                widget.Clock(
                    # format='%d.%m.%Y',
                    format="%H:%M",
                    background=sapphire,
                    foreground=crust,
                ),
                widget.Systray(
                    background=sapphire,
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
        Match(title=re.compile("^Steam - News.*$")),
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
