import Foundation

// Numbering follows the Nizari Ismaili count used by the community today.
// A selection of key Imams, not the full list of 50.

enum ImamsData {
    static let all: [Imam] = [
        Imam(number: 1, name: "Mawlana Ali ibn Abi Talib", era: .early,
             period: "Imamat 632–661 CE",
             summary: "Cousin and son-in-law of the Prophet Muhammad, husband of Bibi Fatima, and the first Imam.",
             coolFact: "His sermons, letters and sayings were gathered around 1000 CE into the Nahj al-Balagha (\"Peak of Eloquence\"), still studied for its emphasis on reason, justice and ethical government.",
             realm: "Fourth caliph of the early Islamic state (656–661)",
             residence: "Madina, then Kufa in Iraq",
             meanwhile: [
                "China: the Tang dynasty flourishes under Emperor Gaozong.",
                "Byzantium: Emperor Constans II rules from Constantinople.",
                "Arabia: around 650, the Qur'an is gathered into a single standard text."
             ],
             contemporaries: [
                "Emperor Taizong of Tang China",
                "Emperor Heraclius of Byzantium",
                "King Harsha of northern India",
                "Mu'awiya, governor of Syria and later Umayyad caliph"
             ]),
        Imam(number: 2, name: "Imam Husayn ibn Ali", era: .early,
             period: "Imamat c. 661–680 CE",
             summary: "Grandson of the Prophet, son of Hazrat Ali and Bibi Fatima.",
             coolFact: "He was martyred at Karbala in 680 after refusing to pledge allegiance to an unjust ruler. Muslims around the world remember him on Ashura.",
             realm: "Did not rule — lived under the Umayyad caliphate",
             residence: "Madina; martyred at Karbala, Iraq",
             meanwhile: [
                "Damascus: the Umayyad dynasty rules a vast empire.",
                "Byzantium: Constantinople survives an Arab siege (674–678) using 'Greek fire'.",
                "China: Wu Zetian is rising to power at the Tang court."
             ],
             contemporaries: [
                "Yazid I, Umayyad caliph",
                "Emperor Gaozong and Wu Zetian of Tang China",
                "Emperor Constantine IV of Byzantium"
             ]),
        Imam(number: 5, name: "Imam Ja'far al-Sadiq", era: .early,
             period: "Imamat c. 733–765 CE",
             summary: "A towering scholar in Madina whose teaching shaped Shia thought.",
             coolFact: "His study circle is traditionally said to have included figures later associated with Sunni law schools, such as Abu Hanifa and Malik ibn Anas.",
             realm: "Did not rule — lived under the Umayyad, then Abbasid caliphates",
             residence: "Madina, Arabia",
             meanwhile: [
                "750: the Abbasids overthrow the Umayyads; Baghdad is founded in 762.",
                "751: the Battle of Talas between the Abbasids and Tang China — papermaking is traditionally said to have spread west afterward.",
                "Europe: Pepin the Short becomes king of the Franks (751)."
             ],
             contemporaries: [
                "Al-Mansur, Abbasid caliph and founder of Baghdad",
                "Emperor Xuanzong of Tang China",
                "Pepin the Short, king of the Franks",
                "Abu Hanifa, founder of the Hanafi school of law",
                "Li Bai and Du Fu, China's great poets"
             ]),
        Imam(number: 6, name: "Imam Isma'il", era: .early,
             period: "8th century CE (dates debated)",
             summary: "Designated successor of Imam Ja'far al-Sadiq.",
             coolFact: "The Ismailis take their name from him.",
             realm: "Did not rule — lived under the Abbasid caliphate",
             residence: "Madina, Arabia",
             meanwhile: [
                "Spain: an Umayyad prince founds the Emirate of Córdoba (756).",
                "Baghdad is built as the round city of the Abbasids.",
                "Japan: the great Buddha of Todai-ji in Nara is dedicated (752)."
             ],
             contemporaries: [
                "Al-Mansur, Abbasid caliph",
                "Abd al-Rahman I, founder of the Emirate of Córdoba",
                "Pepin the Short, king of the Franks"
             ]),
        Imam(number: 11, name: "Imam al-Mahdi", era: .fatimid,
             period: "Imamat until 934 · Caliph 909–934",
             summary: "Emerged from a period of concealment in Salamiyya, Syria, to found the Fatimid state in North Africa.",
             coolFact: "Founded the coastal capital al-Mahdiyya in today's Tunisia, named after himself.",
             realm: "Fatimid Caliphate — North Africa",
             residence: "Salamiyya (Syria), then Raqqada and al-Mahdiyya (Tunisia)",
             meanwhile: [
                "China: the Tang dynasty collapses (907).",
                "Spain: Abd al-Rahman III declares himself caliph in Córdoba (929).",
                "Baghdad: the Abbasid caliphs are losing real power."
             ],
             contemporaries: [
                "Al-Muqtadir, Abbasid caliph in Baghdad",
                "Abd al-Rahman III, caliph of Córdoba",
                "Athelstan, first king of all England",
                "Al-Razi, physician and chemist",
                "Al-Farabi, philosopher"
             ]),
        Imam(number: 14, name: "Imam al-Mu'izz li-Din Allah", era: .fatimid,
             period: "Imamat 953–975 CE",
             summary: "Expanded the Fatimid state into Egypt.",
             coolFact: "His forces founded Cairo (al-Qahira) in 969, and the al-Azhar mosque followed in 970–972. The jurist al-Qadi al-Nu'man also records him requesting a pen that held its own ink without leaking — an early 'fountain pen'.",
             realm: "Fatimid Caliphate — North Africa, Egypt, the Hijaz and parts of Syria",
             residence: "al-Mansuriyya (Tunisia), then Cairo from 973",
             meanwhile: [
                "China: the Song dynasty is founded (960).",
                "Germany: Otto I is crowned Holy Roman Emperor (962).",
                "Spain: Córdoba's caliph al-Hakam II builds a famous library."
             ],
             contemporaries: [
                "Otto I, Holy Roman Emperor",
                "Emperor Taizu, founder of the Song dynasty",
                "Nikephoros II Phokas, Byzantine emperor",
                "Al-Hakam II, caliph of Córdoba",
                "Al-Mutanabbi, famous Arab poet"
             ]),
        Imam(number: 16, name: "Imam al-Hakim bi-Amr Allah", era: .fatimid,
             period: "Imamat 996–1021 CE",
             summary: "Patron of learning in Fatimid Cairo.",
             coolFact: "Founded the Dar al-'Ilm (\"House of Knowledge\") in 1005, a public library and teaching centre.",
             realm: "Fatimid Caliphate",
             residence: "Cairo, Egypt",
             meanwhile: [
                "Cairo: Ibn al-Haytham, a pioneer of optics, works in the city.",
                "Persia: Ibn Sina (Avicenna) is writing on medicine and philosophy.",
                "Japan: Murasaki Shikibu writes The Tale of Genji.",
                "Around 1000: Norse explorers reach North America."
             ],
             contemporaries: [
                "Basil II, Byzantine emperor",
                "Mahmud of Ghazni",
                "Cnut the Great, king of England, Denmark and Norway",
                "Ibn Sina (Avicenna) and al-Biruni, scholars",
                "Murasaki Shikibu, Japanese novelist"
             ]),
        Imam(number: 18, name: "Imam al-Mustansir bi'llah", era: .fatimid,
             period: "Imamat 1036–1094 CE",
             summary: "Reigned for nearly 60 years, one of the longest reigns in Islamic history.",
             coolFact: "The Persian poet-philosopher Nasir Khusraw travelled to Cairo during his reign and returned east as a da'i.",
             realm: "Fatimid Caliphate — briefly even recognised in Baghdad (1058–59)",
             residence: "Cairo, Egypt",
             meanwhile: [
                "1054: the Great Schism divides the Catholic and Orthodox churches.",
                "1055: the Seljuk Turks take Baghdad.",
                "1066: the Normans conquer England."
             ],
             contemporaries: [
                "William the Conqueror",
                "Seljuk sultans Tughril Beg, Alp Arslan and Malik Shah",
                "Nizam al-Mulk, Seljuk vizier",
                "Omar Khayyam, poet and mathematician",
                "Pope Gregory VII",
                "Nasir Khusraw"
             ]),
        Imam(number: 19, name: "Imam Nizar", era: .fatimid,
             period: "Imamat 1094–1095 CE",
             summary: "Eldest son of al-Mustansir; the succession after his father divided the Ismailis.",
             coolFact: "The Nizari Ismailis — today's Ismaili community led by the Aga Khan — are named after him.",
             realm: "Heir to the Fatimid state; supported in Alexandria",
             residence: "Cairo and Alexandria, Egypt",
             meanwhile: [
                "1090: Hasan-i Sabbah takes the fortress of Alamut in Persia.",
                "1095: Pope Urban II calls for the First Crusade.",
                "China: the Song dynasty uses movable type and the magnetic compass."
             ],
             contemporaries: [
                "Pope Urban II",
                "Alexios I Komnenos, Byzantine emperor",
                "Hasan-i Sabbah, da'i at Alamut",
                "Al-Ghazali, theologian"
             ]),
        Imam(number: 23, name: "Imam Hasan 'ala Dhikrihi al-Salam", era: .alamut,
             period: "Imamat 1162–1166 CE",
             summary: "Led the community from the mountain fortress of Alamut in Persia.",
             coolFact: "In 1164 he proclaimed the qiyama, emphasising the inner, spiritual meaning of the faith.",
             realm: "Nizari state — fortresses and towns across Persia and Syria",
             residence: "Alamut, northern Persia",
             meanwhile: [
                "1147–49: the Second Crusade.",
                "Cambodia: Angkor Wat is completed.",
                "Paris: building of Notre-Dame begins (1163)."
             ],
             contemporaries: [
                "Nur al-Din Zangi, ruler of Syria",
                "Frederick Barbarossa, Holy Roman Emperor",
                "Henry II of England and Eleanor of Aquitaine",
                "Ibn Rushd (Averroes), philosopher",
                "Genghis Khan, born around 1162"
             ]),
        Imam(number: 27, name: "Imam Rukn al-Din Khurshah", era: .alamut,
             period: "Imamat 1255–1257 CE",
             summary: "The last Imam to reside at Alamut.",
             coolFact: "Alamut surrendered to the Mongols in 1256, ending the Nizari state in Persia — but not the Imamat, which continued.",
             realm: "Nizari state in Persia (its final years)",
             residence: "Alamut and Maymun-Diz, northern Persia",
             meanwhile: [
                "The Mongols under Hülegü sweep west; Baghdad falls in 1258.",
                "West Africa: the Mali Empire rises after Sundiata's victories.",
                "Europe: Louis IX of France leads crusades."
             ],
             contemporaries: [
                "Möngke Khan, Mongol Great Khan",
                "Hülegü, Mongol conqueror",
                "Nasir al-Din al-Tusi, astronomer",
                "Louis IX of France",
                "Rumi, poet",
                "Thomas Aquinas, philosopher"
             ]),
        Imam(number: 32, name: "Imam Mustansir bi'llah II", era: .alamut,
             period: "Imamat c. 1463–1480 CE",
             summary: "First known Imam to settle at Anjudan in central Persia.",
             coolFact: "Began the 'Anjudan revival'. His mausoleum, locally called Shah Qalandar, still stands in Anjudan.",
             realm: "Did not rule — lived under Turkmen dynasties in Persia",
             residence: "Anjudan, central Persia",
             meanwhile: [
                "1453: the Ottomans take Constantinople.",
                "Germany: Gutenberg's printing press spreads across Europe.",
                "South America: the Inca Empire expands under Pachacuti."
             ],
             contemporaries: [
                "Mehmed II, Ottoman sultan",
                "Uzun Hasan, ruler of Persia",
                "Lorenzo de' Medici of Florence",
                "Leonardo da Vinci",
                "Jami, Persian poet"
             ]),
        Imam(number: 46, name: "Aga Khan I (Hasan Ali Shah)", era: .modern,
             period: "Imamat 1817–1881 CE",
             summary: "Moved the seat of the Imamat from Persia to India in the 1840s.",
             coolFact: "Received the title 'Aga Khan' from Fath Ali Shah Qajar of Persia around 1818, and married one of the Shah's daughters.",
             realm: "Governor of Kirman for the Qajar Shah; later lived in British India",
             residence: "Mahallat (Persia), then Bombay (India)",
             meanwhile: [
                "Railways and steamships spread with the Industrial Revolution.",
                "1857: rebellion against British East India Company rule in India.",
                "1861–65: the American Civil War."
             ],
             contemporaries: [
                "Fath Ali Shah Qajar of Persia",
                "Queen Victoria",
                "Abraham Lincoln",
                "Napoleon III",
                "Mirza Ghalib, Urdu poet"
             ]),
        Imam(number: 48, name: "Aga Khan III (Sir Sultan Muhammad Shah)", era: .modern,
             period: "Imamat 1885–1957 CE",
             summary: "Became Imam aged 7 and led for 72 years — the longest Imamat.",
             coolFact: "Served as President of the League of Nations Assembly in 1937, and championed education, including for girls.",
             realm: "No territory — led a worldwide community and served as an international statesman",
             residence: "Bombay, later Europe",
             meanwhile: [
                "Two world wars reshape the globe (1914–18, 1939–45).",
                "1945: the United Nations is founded.",
                "1947: India and Pakistan gain independence."
             ],
             contemporaries: [
                "Mahatma Gandhi",
                "Muhammad Ali Jinnah",
                "Winston Churchill",
                "Franklin D. Roosevelt",
                "Albert Einstein"
             ]),
        Imam(number: 49, name: "Aga Khan IV (Shah Karim al-Hussaini)", era: .modern,
             period: "Imamat 1957–2025 CE",
             summary: "Became Imam at 20 and led for 67 years; built the Aga Khan Development Network (AKDN).",
             coolFact: "Competed in alpine skiing for Iran at the 1964 Winter Olympics in Innsbruck.",
             realm: "No territory — led a global community and its institutions",
             residence: "Aiglemont, France; Seat of the Imamat in Lisbon from 2018",
             meanwhile: [
                "1969: humans walk on the Moon.",
                "1989: the Berlin Wall falls.",
                "The internet and smartphones connect the world."
             ],
             contemporaries: [
                "Queen Elizabeth II",
                "Nelson Mandela",
                "John F. Kennedy",
                "Martin Luther King Jr.",
                "Pope John Paul II"
             ]),
        Imam(number: 50, name: "Aga Khan V (Shah Rahim al-Hussaini)", era: .modern,
             period: "Imamat since 4 Feb 2025",
             summary: "Mawlana Hazar Imam — the present Imam, designated by his father's will.",
             coolFact: "Before his Imamat he served on the boards of many AKDN agencies and chaired its Environment and Climate Committee.",
             realm: "No territory — leads a global community and its institutions",
             residence: "Seat of the Ismaili Imamat: Lisbon, Portugal",
             meanwhile: [
                "Climate change is one of the world's most urgent challenges.",
                "Artificial intelligence is transforming how people learn and work."
             ],
             contemporaries: [
                "King Charles III, who granted him the style 'His Highness'",
                "Pope Leo XIV"
             ],
             isPresentImam: true)
    ]
}
