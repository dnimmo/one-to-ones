module Layout exposing (standardPadding, verticalSpacing)

import Element exposing (Attribute, padding, spacing)


verticalSpacing : Attribute msg
verticalSpacing =
    spacing 16


standardPadding : Attribute msg
standardPadding =
    padding 16
