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
    'Trust in Allah, but tie your camel - (Sahih al-Tirmidhi 2517)'
    'Knowledge illuminates the path'
    'Patience is beautiful - (Qurʼan 12:83)'
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
    'The seeking of knowledge is obligatory upon every Muslim - (Sahih Ibn Majah 224)'
    'Whoever finds relief for one who is hard-pressed, Allah will make things easy for him in the Hereafter - (Sahih Muslim 2699)'
    'Deeds are judged by intentions - (Sahih al-Bukhari 1)'
    'Cherish that which gives you benefit, and do not lose heart if trouble comes to you - (Sahih Muslim 2664)'
    'Allah does not burden a soul beyond its capacity - (Qurʼan 2:286)'
    'Indeed, with hardship comes ease - (Qurʼan 94:6)'
    'The best among you are those who have the best manners and character - (Sahih al-Bukhari 3559)'
    'Speak good or remain silent - (Sahih al-Bukhari 6014)'
  ]
  let encouragement = $encouragements | _select-random
  print $"($greeting), Akif. You get a ($gift). ($encouragement)!"
}

def _select-random []: list<string> -> string {
  let max = ( $in | length ) - 1
  return ( $in | get (random int 0..$max) )
}
