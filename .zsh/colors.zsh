typeset -A color
color=(
    # Reset
    reset "[0m"       # Text Reset

    # Regular Colors
    black "[0;30m"        # Black
    red "[0;31m"          # Red
    green "[0;32m"        # Green
    yellow "[0;33m"       # Yellow
    blue "[0;34m"         # Blue
    purple "[0;35m"       # Purple
    cyan "[0;36m"         # Cyan
    white "[0;37m"        # White

    # Bold
    Bblack "[1;30m"       # Black
    Bred "[1;31m"         # Red
    Bgreen "[1;32m"       # Green
    Byellow "[1;33m"      # Yellow
    Bblue "[1;34m"        # Blue
    Bpurple "[1;35m"      # Purple
    Bcyan "[1;36m"        # Cyan
    Bwhite "[1;37m"       # White

    # Underline
    Ublack "[4;30m"       # Black
    Ured "[4;31m"         # Red
    Ugreen "[4;32m"       # Green
    Uyellow "[4;33m"      # Yellow
    Ublue "[4;34m"        # Blue
    Upurple "[4;35m"      # Purple
    Ucyan "[4;36m"        # Cyan
    Uwhite "[4;37m"       # White

    # High Intensty
    Iblack "[0;90m"       # Black
    Ired "[0;91m"         # Red
    Igreen "[0;92m"       # Green
    Iyellow "[0;93m"      # Yellow
    Iblue "[0;94m"        # Blue
    Ipurple "[0;95m"      # Purple
    Icyan "[0;96m"        # Cyan
    Iwhite "[0;97m"       # White

    # Bold High Intensty
    BIblack "[1;90m"      # Black
    BIred "[1;91m"        # Red
    BIgreen "[1;92m"      # Green
    BIyellow "[1;93m"     # Yellow
    BIblue "[1;94m"       # Blue
    BIpurple "[1;95m"     # Purple
    BIcyan "[1;96m"       # Cyan
    BIwhite "[1;97m"      # White
)

typeset -A bg
bg=(
    # Background
    black "[40m"       # Black
    red "[41m"         # Red
    green "[42m"       # Green
    yellow "[43m"      # Yellow
    blue "[44m"        # Blue
    purple "[45m"      # Purple
    cyan "[46m"        # Cyan
    white "[47m"       # White

    # High Intensty backgrounds
    Iblack "[0;100m"   # Black
    Ired "[0;101m"     # Red
    Igreen "[0;102m"   # Green
    Iyellow "[0;103m"  # Yellow
    Iblue "[0;104m"    # Blue
    Ipurple "[10;95m"  # Purple
    Icyan "[0;106m"    # Cyan
    Iwhite "[0;107m"   # White
)
