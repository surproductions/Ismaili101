import Foundation

// Similarities and differences between Islam and other worldviews, and between Muslim groups.
// Written to describe each tradition respectfully, as its own followers would recognise it.
// Follower figures: Pew Research Center, 2020 estimates (published 2025), unless noted.

enum CompareData {
    static let islam = ReligionProfile(
        name: "Islam", symbol: "moon.stars.fill",
        origin: "7th century CE, Mecca and Madina, Arabia",
        followers: "About 2 billion (25.6% of the world)",
        god: "One God (Allah), beyond all description",
        keyFigures: "The Prophet Muhammad, the last of a line of prophets including Abraham, Moses and Jesus",
        scriptures: "The Qur'an",
        afterlife: "The soul continues after death; a Day of Judgement; paradise and hell",
        practices: "Prayer, fasting in Ramadan, charity, pilgrimage, remembrance of God",
        similarities: [], differences: [])

    static let religions: [ReligionProfile] = [
        ReligionProfile(
            name: "Judaism", symbol: "star.fill",
            origin: "Over 3,000 years ago, in the ancient Near East",
            followers: "About 15 million",
            god: "One God, who made a covenant with the people of Israel",
            keyFigures: "Abraham, Moses, the Hebrew prophets",
            scriptures: "The Hebrew Bible (Tanakh), especially the Torah; the Talmud",
            afterlife: "Views vary; many believe in a 'world to come' and resurrection, but the focus is on living rightly now",
            practices: "Shabbat (weekly day of rest), prayer, kosher food laws, festivals such as Passover and Yom Kippur",
            similarities: [
                "Strict belief in one God, with no images of God",
                "Abraham and Moses are honoured prophets in both",
                "Dietary laws — kosher and halal — including no pork",
                "Regular prayer, charity and a sacred law for daily life",
                "The Qur'an calls Jews 'People of the Book'"
            ],
            differences: [
                "Judaism does not recognise Jesus or Muhammad as prophets",
                "Its scripture is the Hebrew Bible, not the Qur'an",
                "Judaism centres on God's covenant with the Jewish people; Islam addresses all humanity"
            ]),
        ReligionProfile(
            name: "Christianity", symbol: "cross.fill",
            origin: "1st century CE, Roman Judea, from the life of Jesus",
            followers: "About 2.3 billion (28.8% of the world)",
            god: "One God in three persons — Father, Son and Holy Spirit (the Trinity)",
            keyFigures: "Jesus Christ, believed to be the Son of God; Mary; the apostles",
            scriptures: "The Bible — Old and New Testaments",
            afterlife: "Resurrection, judgement, heaven and hell; salvation through Jesus",
            practices: "Prayer, worship in church, baptism, communion, Christmas and Easter",
            similarities: [
                "Jesus is honoured in the Qur'an as a great prophet and the Messiah",
                "The Qur'an affirms Jesus' virgin birth and his miracles, such as healing the blind and raising the dead by God's permission",
                "Mary is deeply honoured — a whole sura of the Qur'an is named after her",
                "Belief in a Day of Judgement, heaven and hell",
                "The Qur'an calls Christians 'People of the Book'"
            ],
            differences: [
                "Islam teaches that Jesus is a prophet, not divine, and does not accept the Trinity",
                "The Qur'an says Jesus was not killed on the cross as it appeared (4:157); Muslims have interpreted this verse in different ways",
                "Christianity does not recognise Muhammad as a prophet"
            ]),
        ReligionProfile(
            name: "Hinduism", symbol: "sun.max.fill",
            origin: "No single founder; roots over 3,000 years old, in the Indian subcontinent",
            followers: "About 1.2 billion (14.9% of the world)",
            god: "Many traditions; often one ultimate reality (Brahman) understood through many forms and deities",
            keyFigures: "Sages, gods and avatars such as Krishna and Rama",
            scriptures: "The Vedas, Upanishads, Bhagavad Gita and epics such as the Ramayana",
            afterlife: "Rebirth (samsara) shaped by karma, with liberation (moksha) as the goal",
            practices: "Worship (puja), festivals such as Diwali, yoga and meditation, pilgrimage",
            similarities: [
                "An ultimate reality beyond all human description",
                "Devotional poetry and song at the heart of worship",
                "Meditation and inner spiritual discipline",
                "Ethical duty and service to others"
            ],
            differences: [
                "Islam rejects worship of many deities and of images",
                "Mainstream Islam teaches one earthly life followed by judgement, not rebirth",
                "Islam has a single scripture and line of prophets"
            ],
            ismailiNote: "In South Asia, some ginans used concepts and imagery familiar to Hindu audiences — such as the idea of avatars — to explain Islamic teachings."),
        ReligionProfile(
            name: "Buddhism", symbol: "circle.circle",
            origin: "About 2,500 years ago, in northern India, from the teachings of Siddhartha Gautama (the Buddha)",
            followers: "About 324 million (4.1% of the world)",
            god: "Does not focus on a creator God; the goal is awakening",
            keyFigures: "The Buddha, and later teachers",
            scriptures: "The Tripitaka (Pali Canon) and many sutras",
            afterlife: "Rebirth driven by karma, until freedom (nirvana)",
            practices: "Meditation, ethical living (the Eightfold Path), compassion, monastic life",
            similarities: [
                "Meditation and mindfulness — compare Ismaili early-morning bandagi",
                "Compassion and kindness to all living beings",
                "Freedom from greed and attachment to the world",
                "A path of disciplined inner growth"
            ],
            differences: [
                "Islam centres on one creator God; Buddhism does not",
                "Rebirth and nirvana, rather than one life and judgement",
                "No line of prophets or revealed scripture in the same sense"
            ]),
        ReligionProfile(
            name: "Sikhism", symbol: "hands.sparkles.fill",
            origin: "About 1500 CE, in the Punjab, from the teachings of Guru Nanak",
            followers: "About 25–30 million (estimates vary)",
            god: "One God (Ik Onkar), formless and beyond time",
            keyFigures: "Guru Nanak and the nine Gurus who followed",
            scriptures: "The Guru Granth Sahib",
            afterlife: "Rebirth, with liberation through God's grace and remembrance",
            practices: "Remembering God's name, devotional hymns, service (seva), the free community kitchen (langar)",
            similarities: [
                "Strict belief in one formless God",
                "Devotional hymns — much like ginans — composed in South Asian languages",
                "Seva, selfless service, is close to the Ismaili ideal of khidmat",
                "Equality of all people, regardless of caste or status"
            ],
            differences: [
                "Guidance comes through the Gurus and the Guru Granth Sahib, not the Qur'an and Prophet Muhammad",
                "Belief in rebirth"
            ],
            ismailiNote: "Ismaili pirs and the Sikh Gurus taught in the same regions of Punjab and Sindh, and both traditions express devotion through sung poetry."),
        ReligionProfile(
            name: "Zoroastrianism", symbol: "flame.fill",
            origin: "Ancient Persia, from the prophet Zarathustra (dates debated, possibly over 3,000 years ago)",
            followers: "Roughly 100,000–200,000 (estimates vary)",
            god: "One supreme, wise God — Ahura Mazda",
            keyFigures: "The prophet Zarathustra (Zoroaster)",
            scriptures: "The Avesta",
            afterlife: "Souls cross a bridge to judgement, leading to heaven or hell, with a final renewal of the world",
            practices: "Prayer before fire as a symbol of purity; 'good thoughts, good words, good deeds'",
            similarities: [
                "One supreme God of wisdom and goodness",
                "Judgement after death and a bridge souls must cross — compare the Sirat in Islam",
                "A strong ethic of truth and doing good",
                "Persia shaped both traditions — and much of Ismaili history took place there"
            ],
            differences: [
                "Different prophet and scripture",
                "Fire temples and rituals of purity unique to Zoroastrianism"
            ],
            ismailiNote: "Nasir Khusraw wrote about the Sirat — the bridge of judgement — as a symbol of the soul's path to truth."),
        ReligionProfile(
            name: "Non-religious", symbol: "atom",
            origin: "Atheism, agnosticism and humanism have roots in ancient philosophy; they grew widely in the modern era",
            followers: "About 1.9 billion religiously unaffiliated (24.2%) — not all are atheists; many hold spiritual beliefs without a religion",
            god: "Atheists believe there is no God; agnostics hold that we cannot know",
            keyFigures: "No founder; thinkers and scientists across history",
            scriptures: "None; evidence, reason and science guide beliefs",
            afterlife: "Most believe there is no afterlife, or that we cannot know",
            practices: "Meaning and ethics built from human reason, relationships and wellbeing",
            similarities: [
                "A high value on reason, questions and evidence — central to Ismaili thought too",
                "Curiosity about how the universe works",
                "Ethics of human dignity, fairness and service",
                "Openness to science, including evolution and the Big Bang"
            ],
            differences: [
                "No belief in God, revelation or prophets",
                "Meaning is seen as created by people, not given by God",
                "No belief, or uncertainty, about life after death"
            ])
    ]

    static let groups: [MuslimGroup] = [
        MuslimGroup(name: "Sunni Muslims", share: "The large majority — roughly 85–90% of Muslims",
                    leadership: "Leaders chosen by the community; the first four caliphs are honoured as 'rightly guided'. Religious scholars (ulama) interpret the faith.",
                    whereFound: "Across the Muslim world",
                    features: ["Four main schools of law: Hanafi, Maliki, Shafi'i, Hanbali",
                               "Hadith collections such as Bukhari and Muslim",
                               "Five daily prayers in the mosque"]),
        MuslimGroup(name: "Twelver Shia", share: "The largest Shia group",
                    leadership: "Twelve Imams from Ali; the twelfth, Muhammad al-Mahdi, is believed to be in hiding (occultation) since the 9th century and will return. Senior scholars guide the community in his absence.",
                    whereFound: "Mainly Iran, Iraq, Azerbaijan, Bahrain and Lebanon",
                    features: ["Remembrance of Karbala during Muharram",
                               "Pilgrimage to the shrines of the Imams",
                               "Shared the line of Imams with Ismailis until 765"]),
        MuslimGroup(name: "Nizari Ismailis", share: "A Shia community of several million living in over 25 countries",
                    leadership: "A living, present Imam — today His Highness Prince Rahim Aga Khan V, the 50th Imam.",
                    whereFound: "South and Central Asia, the Middle East, Africa, Europe and North America",
                    features: ["Emphasis on intellect and the inner meaning of faith (ta'wil)",
                               "Prayer in the jamatkhana, including the Du'a",
                               "Strong traditions of service (khidmat) and pluralism"]),
        MuslimGroup(name: "Dawoodi Bohras (Musta'li Ismailis)", share: "The largest Musta'li Ismaili community",
                    leadership: "Their Imam has been in seclusion since the 12th century; the community is led by a representative, the Da'i al-Mutlaq.",
                    whereFound: "Mainly India, with communities worldwide",
                    features: ["Preserve much Fatimid heritage and law",
                               "Separated from the Nizaris in 1094"]),
        MuslimGroup(name: "Zaydis", share: "A small Shia group",
                    leadership: "Any learned and righteous descendant of Ali and Fatima who rises against injustice can be Imam.",
                    whereFound: "Mainly Yemen",
                    features: ["Named after Zayd ibn Ali, a grandson of Imam Husayn",
                               "In law and practice, often close to Sunni Islam"]),
        MuslimGroup(name: "Sufism", share: "Not a separate sect — found among Sunnis and Shias",
                    leadership: "Spiritual orders (tariqas) guided by masters (shaykhs)",
                    whereFound: "Throughout the Muslim world",
                    features: ["The mystical, inner path of Islam",
                               "Remembrance (dhikr), poetry and music — Rumi is a famous Sufi poet",
                               "Ismaili Imams lived as Sufi masters during centuries of hiding"])
    ]

    static let sharedValues = [
        "Almost every tradition teaches some form of the golden rule: treat others as you would want to be treated.",
        "Compassion, honesty, care for the poor and the search for meaning appear across faiths and worldviews.",
        "Ismaili pluralism asks us to understand others on their own terms — learning from differences, not just tolerating them."
    ]
}
