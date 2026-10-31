import Foundation

// Chapter 16: the life of the Prophet Muhammad, the birth of Islam, and how Muslims divided.
// Introductory wording — review with community educators before release.

enum ProphetChapter {
    static let chapter = Chapter(
        id: 16,
        title: "The Prophet & the Birth of Islam",
        subtitle: "Muhammad's life, the first revelation, and what came after",
        symbol: "moon.stars.fill",
        overview: [
            "Islam began in 7th-century Arabia with Muhammad ibn Abdullah, a merchant of Mecca known for his honesty. At about forty, while meditating in a cave, he received the first revelation of what became the Qur'an.",
            "Over 23 years he faced persecution, migrated to Madina, built a community, and returned to Mecca in peace. By his death in 632, much of Arabia had embraced Islam.",
            "His death raised a question that still shapes Muslims today: who should lead after him? The answers to that question gave rise to Sunni and Shia Islam — and, in time, to the Ismailis."
        ],
        keyTerms: [
            KeyTerm(term: "Hira", definition: "The cave on Mount Nur near Mecca where Muhammad meditated and received the first revelation."),
            KeyTerm(term: "Hijra", definition: "The migration from Mecca to Madina in 622 — the start of the Islamic calendar."),
            KeyTerm(term: "Ahl al-Bayt", definition: "'People of the House' — the Prophet's family, including Ali, Fatima, Hasan and Husayn."),
            KeyTerm(term: "Caliph", definition: "'Successor' — the title of the leaders of the Muslim community after the Prophet."),
            KeyTerm(term: "Ummah", definition: "The worldwide community of Muslims.")
        ],
        quiz: [
            QuizQuestion(prompt: "Where was the Prophet Muhammad born?",
                         options: ["Mecca", "Madina", "Jerusalem", "Damascus"], correctIndex: 0,
                         explanation: "In Mecca, around 570 CE."),
            QuizQuestion(prompt: "What was the first word of the first revelation?",
                         options: ["Read! (Iqra)", "Pray!", "Go!", "Listen!"], correctIndex: 0,
                         explanation: "The first verses, 96:1–5, begin with 'Read!'"),
            QuizQuestion(prompt: "What does the Hijra (622) mark?",
                         options: ["The start of the Islamic calendar", "The Prophet's birth", "The first revelation", "The Prophet's death"], correctIndex: 0,
                         explanation: "The migration to Madina begins the Islamic calendar.")
        ],
        lessons: [
            Lesson(heading: "Arabia before Islam", symbol: "sun.dust.fill", body: [
                "In the 6th century, Arabia sat between two great empires — the Byzantine and the Persian. Mecca was a trading town on caravan routes, and home to the Kaaba, a shrine filled with idols of many tribal gods.",
                "Society was organised by tribe and clan. Poetry was prized, but life could be harsh: blood feuds, little protection for the poor, orphans or women, and great gaps between rich and poor.",
                "A few people, called hanifs, rejected idol worship and sought the one God of Abraham."
            ]),
            Lesson(heading: "An orphan called 'the trustworthy'", symbol: "person.fill", body: [
                "Muhammad was born in Mecca around 570 CE. His father Abdullah died before he was born, and his mother Amina died when he was six. He was raised by his grandfather Abd al-Muttalib and then by his uncle Abu Talib — the father of Ali.",
                "As a young man he worked as a shepherd and then a merchant. People called him al-Amin, 'the trustworthy'. When the tribes argued over who would replace the sacred Black Stone during the rebuilding of the Kaaba, they accepted his solution: place the stone on a cloak and let every clan lift it together.",
                "At about 25 he married Khadija, a respected businesswoman who had employed him. Their marriage of some 25 years was one of deep love and partnership."
            ], reflection: "What would it take for people to call me 'trustworthy'?"),
            Lesson(heading: "The cave and the first revelation", symbol: "mountain.2.fill", body: [
                "Muhammad often withdrew to the cave of Hira on Mount Nur to meditate. In 610, when he was about forty, during the month of Ramadan, the angel Gabriel appeared and commanded: 'Read!' He replied, 'I am not one who reads.' After the command came three times, the first verses were revealed: 'Read, in the name of your Lord who created…' (96:1–5).",
                "He was shaken. He hurried home trembling and said to Khadija, 'Cover me, cover me!' He told her he feared for himself. Khadija comforted him: God would never disgrace him, she said, because he was kind to relatives, helped the weak, and supported those in need.",
                "She took him to her cousin Waraqa ibn Nawfal, an elderly Christian scholar, who told him this was the same divine message that had come to Moses — and warned that his people would turn against him. Khadija became the first person to accept Islam."
            ], reflection: "Khadija believed in him before anyone else. Who believes in me — and who do I believe in?"),
            Lesson(heading: "The pause, and a human prophet", symbol: "hourglass", body: [
                "After the first revelation came a pause (fatra) before revelation resumed. The Prophet felt great uncertainty and distress during this time; then came the verses of Surat al-Duha: 'Your Lord has not forsaken you, nor does He hate you' (93:3).",
                "Some early biographies add that his despair was so deep that he thought of ending his life, and that Gabriel appeared to reassure him. Many scholars consider these particular reports weak, because they rest on an addition by a later narrator without a full chain back to the Prophet.",
                "What the reliable accounts do show is a deeply human prophet: frightened at first, unsure, comforted by the people who loved him. For many Muslims, that honesty about his fear is part of what makes his story believable.",
                "If you are ever going through a dark time, you don't have to carry it alone. Talk to someone you trust."
            ]),
            Lesson(heading: "Preaching and persecution in Mecca", symbol: "megaphone.fill", body: [
                "The first believers included Khadija, the young Ali, Zayd ibn Haritha and Abu Bakr. After about three years the Prophet began preaching openly: there is one God, idols have no power, and the rich must care for the poor.",
                "The leaders of Mecca, whose wealth and status depended on the old order, turned hostile. Believers who had no tribal protection suffered most. Sumayya became the first person killed for her faith; Bilal, an enslaved African, was tortured until Abu Bakr freed him. Some Muslims took refuge with the Christian king of Abyssinia (Ethiopia).",
                "Clan Hashim was boycotted for about three years. Then, in 619 — the 'Year of Sorrow' — both Khadija and Abu Talib died. Around this time, tradition tells of the Night Journey and Ascension (al-Isra' wa'l-Mi'raj), from Mecca to Jerusalem and through the heavens."
            ]),
            Lesson(heading: "Hijra: a new community in Madina", symbol: "figure.walk.motion", body: [
                "In 622, with his life in danger, the Prophet migrated to the oasis town of Yathrib, which became known as Madina, 'the city' of the Prophet. On the night he left, Ali slept in his bed to deceive those plotting against him.",
                "The Hijra is so important that it marks year 1 of the Islamic calendar. In Madina the Prophet drew up an agreement — often called the Constitution of Madina — setting out rights and duties for Muslims, Jews and others living together.",
                "Over the next years came battles with Mecca — Badr (624), Uhud (625) and the Trench (627) — and then the Treaty of Hudaybiyya (628), a peace agreement."
            ]),
            Lesson(heading: "Return to Mecca and farewell", symbol: "house.fill", body: [
                "In 630 the Prophet returned to Mecca with thousands of followers. Instead of taking revenge on those who had persecuted him, he declared a general amnesty. The idols were removed from the Kaaba, which was dedicated again to the one God.",
                "In 632 he made his Farewell Pilgrimage, teaching that all people are equal, that no Arab is better than a non-Arab except in goodness, and that lives and property are sacred.",
                "On the way back, at Ghadir Khumm, he raised Ali's hand and said: 'Of whomsoever I am mawla, Ali is his mawla.' A few months later, in June 632, the Prophet died in Madina."
            ], reflection: "Could I forgive people who had hurt me as deeply as Mecca hurt the Prophet?"),
            Lesson(heading: "How Muslims divided", symbol: "arrow.triangle.branch", body: [
                "While Ali and the family prepared the Prophet's burial, a group of Muslims met at Saqifa and chose Abu Bakr as leader (caliph). He was followed by Umar and Uthman. Ali became the fourth caliph in 656, during a time of civil war, and was killed in 661.",
                "Those who accepted the caliphs chosen by the community became known as Sunni Muslims — today the large majority. Those who held that the Prophet had designated Ali, and that leadership belonged to the Imams from his family, became the Shia. Karbala (680) deepened the divide.",
                "The Shia themselves later divided over the line of Imams: the Zaydis; then, after Imam Ja'far al-Sadiq (765), the Ismailis and the Twelvers. After 1094 the Ismailis divided into the Nizaris — today led by the Aga Khan — and the Musta'lis, whose largest community today is the Dawoodi Bohras.",
                "Despite these differences, Muslims share the Qur'an, the Prophet, belief in one God, and the hope of being one ummah. See the Compare tab in Explore for how the groups differ."
            ])
        ]
    )
}
