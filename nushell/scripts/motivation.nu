def motivate [] {
  let gifts = [ 🌟 🎁 🏆 🌺 🌸 🌹 🎯 🎪 🎨 🎭 📚 💎 🔑 🌈 🦋 🕊️ 🤲 🕌 📿 🕋 🌙 ⭐ 🎈 🎊 🎉 🏅 🎖️ 💐 🌷 🌻 🌼 🌺 🌸 🌹 ]
  let gift = $gifts | _select-random
  let encouragements = [
    'Trust in Allah, but tie your camel'
    'Knowledge illuminates the path'
    'Patience is beautiful'
    'The best among you are those who learn'
    "My potential isn't something for you to decide"
    'Kamehameha your way to success'
    'Ultra instinct mode activated'
    'Spirit bomb of productivity'
    'Dragon fist your challenges'
    'Over 9000 lines of code'
    'Domain expansion: Infinite productivity'
    'Cursed technique: Perfect code'
    'Principal Yaga would be proud'
    'Sukuna level mastery'
    'Nobara precision strikes'
    'Gojo six-eyes efficiency'
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
    'Whoever finds relief for one who is hard-pressed, Allah will make things easy for him in the Hereafter'
    'Deeds are judged by intentions'
    'Cherish that which gives you benefit, and do not lose heart if trouble comes to you'
    'Allah does not burden a soul beyond its capacity'
    'Indeed, with hardship comes ease'
    'The best among you are those who have the best manners and character'
    'Speak good or remain silent'
  ]
  let encouragement = $encouragements | _select-random
  print $"As-Salamu Alaikum, Akif! You get a ($gift). ($encouragement)"
}

def _select-random []: list<string> -> string {
  let max = ( $in | length ) - 1
  return ( $in | get (random int 0..$max) )
}
