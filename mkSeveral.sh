#

# Remember to make sure that css-dir has the source css-files 
# and that res-dir exists.


# Themes

./result/bin/css2HsClassName BS4 bs theme < css/bootstrap.css > res/BS4.hs
./result/bin/css2HsClassName Foundation fou theme < css/foundation.css > res/Foundation.hs
./result/bin/css2HsClassName Semantic sem theme < css/semantic.css > res/Semantic.hs
./result/bin/css2HsClassName W3 "" theme < css/w3.css > res/W3.hs

# Icon-sets


./result/bin/css2HsClassName Elusive el icon < css/elusive-icons.css > res/Elusive.hs
./result/bin/css2HsClassName FA fa icon < css/font-awesome.css > res/FA.hs
./result/bin/css2HsClassName FI fi icon < css/foundation-icons.css > res/FI.hs
./result/bin/css2HsClassName IcoMoon icon icon < css/IcoMoon.css > res/IcoMoon.hs
./result/bin/css2HsClassName Ionicons ion icon < css/ionicons.css > res/Ionicons.hs
./result/bin/css2HsClassName MDI mdi icon < css/materialdesignicons.css > res/MDI.hs
./result/bin/css2HsClassName MfgLabs icon icon < css/mfglabs_iconset.css > res/MfgLabs.hs
./result/bin/css2HsClassName OpenIconic oi icon < css/open-iconic-bootstrap.css > res/OpenIconic.hs
./result/bin/css2HsClassName Typicons ty icon < css/typicons.css > res/Typicons.hs
./result/bin/css2HsClassName FlagIcons flag icon < css/flag-icon.css > res/FlagIcons.hs

