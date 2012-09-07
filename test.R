options(FigshareKey = "ABATdHMsDEXFlEZtwGrneA")
options(FigsharePrivateKey = "aAvBMGgV3vSSTHB007F8Sw")
options(FigshareToken = "TKF2gICyekofLReGMlCUAAcNL2yR3FUOzrKCU2Iui8VATKF2gICyekofLReGMlCUAA")
options(FigsharePrivateToken = "IvxaMREDi1cY5JRF8YM8mw")
require(httr)
require(rfigshare)
fs_auth()
fs_create("Ted's Test","just testing out some stuff",type="paper")

95722
cats <- c(10,7,8)

fs_add_category("95272",cats)