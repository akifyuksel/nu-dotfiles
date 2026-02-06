def motivate [] {
  let greetings = [
    'As-Salamu Alaikum'
    'Bismillah'
    'Because you are so awesome'
    'Hello there'
    'Greetings'
    'Welcome'
  ]
  let greeting = $greetings | _select-random
  let gifts = [ 🌟 🎁 🏆 🌺 🌸 🌹 🎯 🎪 🎨 🎭 📚 💎 🔑 🌈 🦋 🕊️ 🤲 🕌 📿 🕋 🌙 ⭐ 🎈 🎊 🎉 🏅 🎖️ 💐 🌷 🌻 🌼 🌺 🌸 🌹 ]
  let gift = $gifts | _select-random
  let encouragements = [
    'Alhamdulillah for your skills'
    'Trust in Allah, but tie your camel'
    'Knowledge illuminates the path'
    'Patience is beautiful'
    'The best among you are those who learn'
    'Power comes in response to a need'
    'Kamehameha your way to success'
    'Ultra instinct mode activated'
    'Spirit bomb of productivity'
    'Dragon fist your challenges'
    'Saiyan level up achieved'
    'Over 9000 lines of code'
    'Domain expansion: Infinite productivity'
    'Cursed technique: Perfect code'
    'Gojo-sensei would be proud'
    'Sukuna level mastery'
    'Nobara precision strikes'
    'Megumi shadow technique efficiency'
    'Rasengan your problems away'
    'Shadow clone jutsu for multitasking'
    'Naruto level determination'
    'Sasuke focus and precision'
    'Kakashi wisdom in every commit'
    'Getsuga Tensho your obstacles'
    'Bankai mode activated'
    'Ichigo level resolve'
    'Byakuya precision and elegance'
    'Kenpachi raw power approach'
    'The seeking of knowledge is obligatory upon every Muslim'
    'The best of people are those who are most beneficial to others'
    'Whoever follows a path to seek knowledge, Allah will make easy for him the path to Paradise'
    'Actions are judged by intentions'
    'The strong believer is better and more beloved to Allah than the weak believer'
    'Allah does not burden a soul beyond its capacity'
  ]
  let encouragement = $encouragements | _select-random
  print $"($greeting), Akif. You get a ($gift). ($encouragement)!"
}

def _select-random []: list<string> -> string {
  let max = ( $in | length ) - 1
  return ( $in | get (random int 0..$max) )
}
