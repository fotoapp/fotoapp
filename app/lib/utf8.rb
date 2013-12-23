#    <\                     __
#     \\                 .~~  ~~.
#      \\               /|~|     |
#       \\             /======\  |
#      //\\           |>/_\_<_=' |
#      ~\  \          `-`__  \\__|    _
#     <<\ \ \    ___    \..'  `--'   / ~-.
#    <<\\' )_) .+++++ _ (___.--'| _ /~-.  ~-.
#    \_\' /   x||||||| `-._    _.' /~-. ~-.  `.
#     |   |  |X++++++|     \  /   /~-. ~-. ~-./
#     |   `. .||||||||      []   /~-. ~-. ~-./
#     |    |'  ++++++| :::  [] : `-. ~-. ~-.'
#     |    `.        '  ::: []:: _.-:-. ~-/ |
#     (_   /|     _.        []  |____~|`-'  |
#     ||`-'| |_.-' |        |\\/|DREDD|     `.
#     `.___.-'     `.       ||`' \~~~/ >.    l
#                   |   ::  ||    `-' / /`---'\
#                   |    :  ||       ( [(_)[_](]
#                   |       ||       | [       ]
#                  .'       ||       |  \.---./
#                __|________||_______|=.|____|_
#               |: o | o |~\|%/~ o |_ o||-----|
#               |:--'|`-'||X\/X|`-'| `-|`.  .-|
#               `--------'  ll `-------' |  |o|
#                  |                  |  `. |_|
#                  |               :: `.  |   |
#                  |               ::  |  |  .'
#                  |         |\    ::  | .'  |
#                  |         ||     :  | |.  |
#                  `.       .'|     :  | ||..'
#                   |       | `.    :  | |'//
#                   |       |  |    : .' `='
#                   |       |  |   :: |
#                   `.      |  |   :: |
#                    |      |  |   :: |
#                    |_____ |  .-------.
#                   / _     `./.-- :::  \
#                  | | `----' ||        |
#                  | |        |        ||
#                   \         \.-------./
#                    |-------||.-------.|
#                    /-.____.||         |       I   A M   T H E   L A W
#                     |      ||         /
#                     `.     `:.       /
#                      |       |      |
#                      `,      |      |
#                       |      |      /
#                       `.     |     |
#                        |     |     |
#                        |     |     |
#                   __/  |     <     >  \
#                    /   /     /     \
#                   /   :.___.|.-----.|      \
#                LS     `----//      \\    ___\
#            /               `---------'       \
#          _/          /
#                /__            |________\
#
module Utf8
  # Public: Says to hell with procedure and forces UTF8 Encoding!
  #
  # Returns a UTF8 encoded version of the string.
  def force_encoding(string)
    return unless string

    string.force_encoding('UTF-8')

    unless string.valid_encoding?
      string.encode!( 'UTF-8', 'Windows-1252' )
    end

    return string
  rescue EncodingError
    # Force it to UTF-8, throwing out invalid bits
    string.encode!( 'UTF-8', invalid: :replace, undef: :replace )
  end

  module_function :force_encoding
end
