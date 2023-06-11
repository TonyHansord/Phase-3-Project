puts "Seeding Genres"

consoles = ["macOS",
            "Classic Macintosh",
            "Apple II",
            "Atari 7800",
            "Atari 5200",
            "Atari 2600",
            "Atari Flashback",
            "Atari 8-bit",
            "Atari ST",
            "Atari Lynx",
            "Atari XEGS",
            "Jaguar",
            "Commodore / Amiga",
            "Neo Geo",
            "Nintendo Switch",
            "Nintendo 3DS",
            "Nintendo DS",
            "Nintendo DSi",
            "Wii U",
            "Wii",
            "GameCube",
            "Nintendo 64",
            "Game Boy Advance",
            "Game Boy Color",
            "Game Boy",
            "SNES",
            "NES",
            "PC",
            "PlayStation 5",
            "PlayStation 4",
            "PlayStation 3",
            "PlayStation 2",
            "PlayStation",
            "PS Vita",
            "PSP",
            "Genesis",
            "SEGA Saturn",
            "SEGA CD",
            "SEGA 32X",
            "SEGA Master System",
            "Dreamcast",
            "Game Gear",
            "Xbox One",
            "Xbox Series S/X",
            "Xbox 360",
            "Xbox"]
genres = ["2D Fighting",
          "3D Fighting",
          "4X Strategy",
          "Action",
          "Action-Adventure",
          "Action-RPG",
          "Adventure",
          "Air Combat",
          "Arena Brawler",
          "Arena Combat",
          "Arena Shooter",
          "Artillery",
          "Atmospheric",
          "Beat-'em-Up",
          "Board Game",
          "Bullet Hell",
          "Card Game",
          "Casual",
          "Character Action",
          "CMS",
          "Collect-a-thon",
          "Combat",
          "Dating Sim",
          "Dungeon Crawler",
          "Edutainment",
          "Endless Runner",
          "Escape the Room",
          "FPS",
          "Grand Strategy",
          "Hack-n-Slash",
          "Incremental",
          "Interactive Fiction",
          "Interactive Movie",
          "JRPG",
          "Kart Racing",
          "Kusoge",
          "Life Sim",
          "Light Gun",
          "Matching Puzzle",
          "Maze",
          "Mech Combat",
          "Metroidvania",
          "Military Sim",
          "Mini-games",
          "MMO",
          "MOBA",
          "Monster Collecting",
          "Musou",
          "Open World",
          "Paddle",
          "Party",
          "Physics Puzzle",
          "Platform",
          "Puzzle",
          "Programming",
          "Pro Wrestling",
          "Racing",
          "Rail Shooter",
          "Raising Sim",
          "Rhythm",
          "Roguelike",
          "RPG",
          "RTS",
          "Run-n-Gun",
          "Shoot 'em Up",
          "Shooting",
          "Sim",
          "Sports",
          "SRPG",
          "Stealth",
          "Strategy",
          "Survival",
          "Survival Horror",
          "TBS",
          "TCG",
          "Time Management",
          "Tower Defense",
          "TPS",
          "Vehicular Combat",
          "Vehicular Sim",
          "Visual Novel",
          "Walking Simulator",
          "WRPG"]
if Genre.count == 0
  genres.each do |genre|
    Genre.create(name: genre)
  end
end

puts "Seeding Consoles"

if Console.count == 0
  consoles.each do |console|
    Console.create(name: console)
  end
end

Console.where(id: 1..3).each do |apple| apple.update(parent: "Apple") end
Console.where(id: 4..12).each do |atari| atari.update(parent: "Atari") end
Console.find(13).update(parent: "Commodore / Amiga")
Console.find(14).update(parent: "Neo Geo")
Console.where(id: 15..27).each do |nint| nint.update(parent: "Nintendo") end
Console.find(28).update(parent: "PC")
Console.where(id: 29..35).each do |playstation| playstation.update(parent: "PlayStation") end
Console.where(id: 36..42).each do |sega| sega.update(parent: "Sega") end
Console.where(id: 43..46).each do |xbox| xbox.update(parent: "Xbox") end

puts "Seeding Collectors"

tony = Collector.create(name: "Tony")
mark = Collector.create(name: "Mark")
cindy = Collector.create(name: "Cindy")
brad = Collector.create(name: "Brad")

puts "Seeding Games"

tony.games << Game.create(title: "Stealth ATF", console_id: 27, genre_id: 8, year_released: "1990")
tony.games << Game.create(title: "Donkey Kong Country", console_id: 26, genre_id: 53, year_released: "1994")
mark.games << Game.create(title: "Manhunt", console_id: 32, genre_id: 70, year_released: "2003")
tony.games << Game.create(title: "Super Mario 64", console_id: 22, genre_id: 62, year_released: "1996")
mark.games << Game.last

puts "Done Seeding"
