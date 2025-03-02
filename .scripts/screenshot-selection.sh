#!/usr/bin/env sh

# Desc:   Take screenshot by select the visible window or draw.
# Author: Harry Kurn <alternate-se7en@pm.me>
# URL:    https://github.com/owl4ce/dotfiles/tree/ng/.scripts/screenshot-selection.sh

# SPDX-License-Identifier: ISC

# shellcheck disable=SC2016,SC2166

export LANG='POSIX'
exec >/dev/null 2>&1

. ${HOME}/.scripts/ss_var                                    # Variables used for taking screenshots

SCREENSHOT_ICON="/usr/share/icons/Papirus-Dark/symbolic/apps/screenshooter-symbolic.svg"
ERROR_ICON="/usr/share/icons/Papirus-Dark/symbolic/status/dialog-error-symbolic.svg"

[ -x "$(command -v scrot)" ] || exec notify-send -u normal \
                -t 3000 \
                -a Screenshot \
                -i "$ERROR_ICON" \
                -c screenshot-action \
                'Command not found!' 'Install `scrot` to take screenshots.'

{
    rm -f "$TMP_DIR"/*_scrot*.* &

    # Add 210ms delay to trick compositor fade animation.
    sleep .21s

    [ "$SS_POINTER" != 'yes' ] || ARGS='-p'

    scrot ${ARGS} -b \
                  -e "mv -f \$f \"${TMP_DIR}/\"" \
                  -f \
                  -i \
                  -l style=dash,width=3,color=#2be491 \
                  -s \
                  -z \
    || exec notify-send -u normal \
                -t 3000 \
                -a Screenshot \
                -i "$ERROR_ICON" \
                -c screenshot-action \
                'Screenshot canceled!' 'No window selected.'

    wait

    for CURRENT in "$TMP_DIR"/*_scrot*.*; do
        CURRENT="${CURRENT##*/}"
        break
    done

    if [ "$SS_USE_FRAME" = 'yes' ]; then

        # Use `imagemagick` to determine the dominant color of the captured image, and
        # ensure all hexadecimal colors are valid through Extended Regular Expression.
        if [ "$SS_FRAME_COLOR" = 'auto' ]; then

            SS_FRAME_COLOR="$(magick "${TMP_DIR}/${CURRENT}" \
                                     -strip \
                                     -scale 50x50\! \
                                     -depth 8 \
                                     +dither \
                                     -colors 8 \
                                     -format %c \
                              histogram:info: \
                              | sort -nr | grep -m1 -Eo '[#][0-9a-fA-F]{1,}')"

        elif

            grep -m1 -Eoq '^[#][0-9a-fA-F]{1,}$' <<- HEX
				${SS_FRAME_COLOR}
			HEX

        then
            :
        else
            PRESERVED_SFC="$SS_FRAME_COLOR"
            SS_FRAME_COLOR=
        fi

        if [ -n "$SS_FRAME_COLOR" ]; then
            exec notify-send -u normal \
                -t 3000 \
                -a Screenshot \
                -i "$ERROR_ICON" \
                -c screenshot-action \
                'Processing...' 'Please wait.'
        elif [ -n "$PRESERVED_SFC" ]; then
            exec notify-send -u normal \
                -t 3000 \
                -a Screenshot \
                -i "$ERROR_ICON" \
                -c screenshot-action \
                'Screenshot failed' 'Invalid color value.'
        fi

        magick "ephemeral:${TMP_DIR}/${CURRENT}" \
           '(' -clone 0 \
               -alpha extract \
               -draw 'fill black polygon 0,0 0,8 8,0 fill white circle 8,8 8,0' \
           '(' -clone 0 \
               -flip \
           ')' -compose Multiply \
               -composite \
           '(' -clone 0 \
               -flop \
           ')' -compose Multiply \
               -composite \
           ')' -alpha off \
               -compose CopyOpacity \
               -composite \
               -quality 100 \
        miff:- \
        | magick - \
           '(' -clone 0 \
               -background black \
               -shadow "${SS_FRAME_S_OPACITY:-25}x${SS_FRAME_PADDING:-15}+0+$((${SS_FRAME_PADDING:-15}/2))" \
           ')' +swap \
               -background none \
               -layers merge \
               +repage \
               -quality 100 \
        miff:- \
        | magick - \
               -bordercolor "$SS_FRAME_COLOR" \
               -border 5 \
               -quality "${SS_QUALITY:-75}" \
        "${TMP_DIR}/${CURRENT}" \
        || exec notify-send -u normal \
                -t 3000 \
                -a Screenshot \
                -i "$ERROR_ICON" \
                -c screenshot-action \
                'Screenshot failed!' 'An error occurred.'

    fi

    while :; do
        if [ "$SS_CP2CLP" = 'yes' -a -x "$(command -v xclip)" ]; then
            xclip -selection clipboard -target image/png -i "${TMP_DIR}/${CURRENT}"
            STS2='\nCLIPBOARD'
            break
        elif [ "$SS_SAVE" != 'yes' ]; then
            SS_CP2CLP='yes'
        else
            break
        fi
    done

    if [ "$SS_SAVE" = 'yes' ]; then
        [ -d "${SS_SVDIR}/Screenshots" ] || mkdir -p "${SS_SVDIR}/Screenshots"
        mv -f "${TMP_DIR}/${CURRENT}" "${SS_SVDIR}/Screenshots/"
        STS1="${SS_SVDIR##*/}/Screenshots"
    else
        rm -f "${TMP_DIR}/${CURRENT}"
        STS2='CLIPBOARD'
    fi

    exec notify-send -u normal \
                -t 4000 \
                -a Screenshot \
                -i "$SCREENSHOT_ICON" \
                -c screenshot-action \
                'Screenshot' 'Successfully taken!'
} &

exit ${?}
