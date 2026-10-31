import Foundation

/// Shorthand for building quiz questions in the bank files.
func Q(_ prompt: String, _ options: [String], _ correct: Int, _ explanation: String) -> QuizQuestion {
    QuizQuestion(prompt: prompt, options: options, correctIndex: correct, explanation: explanation)
}

/// Extra knowledge-check questions. Each chapter's own quiz + these = 25 questions.
enum QuizBank {
    static func extra(for chapter: Int) -> [QuizQuestion] {
        switch chapter {
        case 1: return ch1
        case 2: return ch2
        case 3: return ch3
        case 4: return ch4
        case 5: return ch5
        case 6: return ch6
        case 7: return ch7
        case 8: return ch8
        case 9: return ch9
        case 10: return ch10
        case 11: return ch11
        case 12: return ch12
        case 13: return ch13
        case 14: return ch14
        case 15: return ch15
        default: return []
        }
    }

    // MARK: Chapter 1 — Din & Dunya
    static let ch1: [QuizQuestion] = [
        Q("What does 'din' mean?", ["The world", "Faith", "Knowledge", "Community"], 1, "Din is faith or religion."),
        Q("What does 'dunya' mean?", ["The material world and everyday life", "Heaven", "Prayer", "Charity"], 0, "Dunya is the world we live in."),
        Q("What does 'Tariqah' literally mean?", ["Light", "Path", "House", "Book"], 1, "Tariqah means path."),
        Q("Ismailis describe their interpretation of Islam as a Tariqah within…", ["Sunni Islam", "Shia Islam", "Sufism only", "Judaism"], 1, "A Tariqah within Shia Islam."),
        Q("Which faculty helps apply ethics to real situations?", ["Intellect", "Memory alone", "Wealth", "Strength"], 0, "Intellect ('aql) bridges principles and practice."),
        Q("What work did the Prophet do before revelation?", ["Farmer", "Merchant", "Soldier", "Scribe"], 1, "He worked as a merchant."),
        Q("Islam began in a town known for…", ["Fishing", "Trade", "Mining", "Shipbuilding"], 1, "Mecca was a trading town."),
        Q("Which is NOT one of the 'two mistakes' the Imams warned against?", ["Withdrawing from the world", "Chasing only the world", "Balancing faith and world", "Treating the world as having no spiritual value"], 2, "Balance is the goal, not a mistake."),
        Q("What is 'amana'?", ["A prayer", "A trust", "A festival", "A tax"], 1, "The earth is held as a trust (amana)."),
        Q("Improving quality of life is described as…", ["Optional", "An ethical duty", "Only for governments", "Unrelated to faith"], 1, "It is an ethical duty."),
        Q("Should a believer pursue education?", ["Only religious education", "Yes, all useful knowledge", "No", "Only after retirement"], 1, "The Imams consistently encourage education."),
        Q("Caring for the environment is…", ["Part of living one's faith", "Unrelated to faith", "Forbidden", "Only a scientific matter"], 0, "Stewardship of the earth is a trust."),
        Q("Whose quality of life does the Imams' guidance address?", ["Only Ismailis", "The community and wider societies", "Only the poor", "Only leaders"], 1, "Both the community and the societies it lives among."),
        Q("Honest earning is an example of…", ["Din in dunya", "Dunya replacing din", "Neither", "A ritual"], 0, "Faith expressed in worldly life."),
        Q("Which pair best describes the Ismaili view?", ["Faith vs. world", "Faith and world in balance", "World first", "Faith only"], 1, "Balance between din and dunya."),
        Q("Leaving the world better for the next generation reflects…", ["Amana (trust)", "Ta'wil", "Nass", "Dhikr"], 0, "Resources are held in trust."),
        Q("Ethics in Islam spoke to everyday life such as…", ["Fair wages and keeping promises", "Only fasting", "Only pilgrimage", "Only prayer"], 0, "Daily conduct is part of faith."),
        Q("Building institutions like schools and hospitals can be…", ["An expression of faith", "A distraction from faith", "Forbidden", "Purely political"], 0, "Worldly service can express faith."),
        Q("Remembering God 'throughout' the day means…", ["Only in jamatkhana", "In work and daily life too", "Only on holidays", "Never at work"], 1, "Remembrance runs through daily life."),
        Q("Why is intellect called a 'bridge'?", ["It connects principles to real decisions", "It replaces faith", "It is a building", "It ends discussion"], 0, "It applies ethics to situations."),
        Q("A balanced life includes…", ["Work, family, society and faith", "Only prayer", "Only work", "Only leisure"], 0, "Din and dunya together."),
        Q("Sharing with those in need is part of…", ["Muslim ethics", "Only modern law", "Neither", "Only Sufism"], 0, "Generosity is a core ethic."),
        Q("Which tab of this app shows the Imamat's worldly work?", ["Impact", "Imams", "Play", "Explore"], 0, "The Impact tab covers AKDN.")
    ]

    // MARK: Chapter 2 — Intellect & the Soul
    static let ch2: [QuizQuestion] = [
        Q("'Aql means…", ["Soul", "Intellect", "Body", "Light"], 1, "'Aql is intellect or reason."),
        Q("'Nafs' means…", ["Soul", "Mind", "World", "Prayer"], 0, "Nafs means soul."),
        Q("What comes from the Universal Intellect?", ["The Universal Soul", "God", "Time only", "Nothing"], 0, "The Universal Soul emerges from the Intellect."),
        Q("Which thinker is associated with classical Ismaili cosmology?", ["Abu Ya'qub al-Sijistani", "Ibn Rushd", "Al-Ghazali", "Rumi"], 0, "Al-Sijistani was a key Ismaili philosopher."),
        Q("Hamid al-Din al-Kirmani was…", ["An Ismaili philosopher", "A Mongol general", "A Fatimid poet only", "A modern scholar"], 0, "A major Fatimid-era Ismaili thinker."),
        Q("Classical Ismaili thinkers used a language shared with…", ["Neoplatonism", "Buddhism", "Stoicism only", "Modern physics"], 0, "Neoplatonic philosophy."),
        Q("What does the Universal Soul do?", ["Animates the cosmos", "Ends time", "Writes scripture", "Nothing"], 0, "It gives motion and life to the cosmos."),
        Q("Plants have which kind of soul?", ["Growing", "Rational", "Sensing", "None"], 0, "A growing (vegetative) soul."),
        Q("Animals add which kind of soul?", ["Growing", "Sensing", "Rational", "Universal"], 1, "A sensing soul."),
        Q("What is special about the human soul?", ["It is rational and can know God", "It cannot change", "It is only physical", "It is the same as an animal's"], 0, "The rational ('speaking') soul."),
        Q("Nafs-i natiqa means…", ["Rational or speaking soul", "Growing soul", "Evil soul", "Universal soul"], 0, "The rational soul unique to humans."),
        Q("Nasir Khusraw saw creation rising from…", ["Minerals to plants to animals to humans", "Humans to animals", "Stars to stones", "Water only"], 0, "A ladder of creation."),
        Q("At the summit of the physical world are…", ["Human beings", "Animals", "Mountains", "Stars"], 0, "Humans are the summit of physical creation."),
        Q("How does the intellect grow?", ["Through disciplined use", "It cannot grow", "Only by age", "Only by sleep"], 0, "Like a muscle, through use."),
        Q("Knowledge is described as the soul's…", ["Nourishment", "Enemy", "Prison", "Decoration"], 0, "Knowledge feeds the soul."),
        Q("Learning is therefore…", ["A spiritual act", "Unrelated to faith", "Dangerous", "Only for children"], 0, "Learning nourishes the soul."),
        Q("Is God described by these thinkers?", ["God is beyond all description", "God is the Universal Soul", "God is the Intellect", "God is matter"], 0, "God is beyond description."),
        Q("The soul as 'traveller' moves from…", ["Potential toward actualised understanding", "Knowledge to ignorance", "Heaven to earth only", "Nowhere"], 0, "Growth from potential to actual."),
        Q("Which three things help the soul's journey?", ["Knowledge, ethics, remembrance", "Wealth, fame, power", "Sleep, food, rest", "Luck, chance, fate"], 0, "Knowledge, ethical action, remembrance."),
        Q("Humans share growth with…", ["Plants", "Stars", "Angels", "Minerals only"], 0, "Growth is shared with plants."),
        Q("Humans share senses with…", ["Animals", "Plants", "Stones", "Stars"], 0, "Sensing is shared with animals."),
        Q("Al-Kirmani's famous work is…", ["Rahat al-'Aql", "Safarnama", "Shahnameh", "Masnavi"], 0, "Rahat al-'Aql, 'Repose of the Intellect'."),
        Q("Why is intellect called a gift?", ["It lets us recognise truth", "It makes us rich", "It replaces faith", "It is inherited wealth"], 0, "It lets us know and choose rightly.")
    ]

    // MARK: Chapter 3 — Zahir & Batin
    static let ch3: [QuizQuestion] = [
        Q("Zahir means…", ["Outward", "Inward", "Upward", "Backward"], 0, "Zahir is the outward dimension."),
        Q("Batin means…", ["Outward", "Inward", "Ancient", "Future"], 1, "Batin is the inward dimension."),
        Q("Exoteric refers to…", ["Zahir", "Batin", "Neither", "Ta'wil"], 0, "Exoteric = outward = zahir."),
        Q("Esoteric refers to…", ["Zahir", "Batin", "Both", "Neither"], 1, "Esoteric = inward = batin."),
        Q("Do Ismailis value only the batin?", ["Yes", "No — both matter", "Only zahir", "Neither"], 1, "Both dimensions matter."),
        Q("The outer form is described as…", ["A doorway", "A wall", "An obstacle", "Meaningless"], 0, "The doorway to meaning."),
        Q("Classical writers compared zahir and batin to…", ["A body and its soul", "Day and night", "Gold and silver", "Fire and water"], 0, "Body and soul."),
        Q("A body without a soul is…", ["Lifeless", "Perfect", "Holy", "Strong"], 0, "So form without meaning is lifeless."),
        Q("What happens if you throw away the outer form?", ["You lose the doorway to meaning", "You reach the meaning faster", "Nothing", "You become perfect"], 0, "Outer form leads to inner meaning."),
        Q("A symbol is…", ["Something visible carrying a deeper meaning", "A lie", "A coin", "A ritual only"], 0, "It carries meaning beyond itself."),
        Q("What does the Qur'an call natural phenomena?", ["Signs (ayat)", "Stories", "Laws", "Songs"], 0, "Nature's events are called signs."),
        Q("'Ayat' also refers to…", ["Verses of the Qur'an", "Prayers", "Imams", "Mosques"], 0, "The same word means verses."),
        Q("In the word analogy, the idea is the…", ["Batin", "Zahir", "Neither", "Both"], 0, "Meaning = batin."),
        Q("A sunrise's batin might be about…", ["Renewal and guidance", "Only physics", "Nothing", "Weather"], 0, "An illustrative inner meaning."),
        Q("Holding only the zahir risks…", ["Missing the purpose", "Gaining everything", "Nothing", "Being too spiritual"], 0, "Form without understanding."),
        Q("What gives life to outer practice?", ["Inner meaning", "Speed", "Repetition alone", "Wealth"], 0, "The batin animates the zahir."),
        Q("Ritual has…", ["Both a form and a meaning", "Only a form", "Only a meaning", "Neither"], 0, "Both dimensions."),
        Q("Who are 'signs' meant for in the Qur'an?", ["People who reflect", "Only scholars", "Only angels", "No one"], 0, "For those who reflect."),
        Q("Looking beyond the surface applies to…", ["Scripture and nature", "Only scripture", "Only nature", "Neither"], 0, "Both are read for meaning."),
        Q("Which is the zahir of a sunrise?", ["Light and physics", "Hope", "Guidance", "Renewal"], 0, "The visible event."),
        Q("Which concept turns zahir toward batin?", ["Ta'wil", "Tanzil", "Nass", "Khidmat"], 0, "Ta'wil interprets the outer toward the inner."),
        Q("A verse of the Qur'an has…", ["An outward and inward aspect", "Only an outward aspect", "No meaning", "Only sound"], 0, "Everything has both."),
        Q("Which pair matches?", ["Zahir–outer, Batin–inner", "Zahir–inner, Batin–outer", "Both outer", "Both inner"], 0, "Zahir outer, batin inner.")
    ]

    // MARK: Chapter 4 — Ta'wil
    static let ch4: [QuizQuestion] = [
        Q("Ta'wil is a form of…", ["Esoteric interpretation", "Translation", "Calligraphy", "Law"], 0, "Interpretation toward inner meaning."),
        Q("Tanzil means…", ["Revelation, 'sending down'", "Interpretation", "Prayer", "Pilgrimage"], 0, "Tanzil is revelation."),
        Q("Which pair is complementary?", ["Tanzil and ta'wil", "Tanzil and tawaf", "Ta'wil and taqlid", "Nass and zakat"], 0, "Revelation and its interpretation."),
        Q("Wajh-i Din means…", ["The Face of Religion", "The Book of Travels", "Provisions for Travellers", "Repose of the Intellect"], 0, "Nasir Khusraw's work."),
        Q("In ta'wil, ablution can symbolise…", ["Purifying the soul through knowledge", "Washing a car", "Fasting", "Travel"], 0, "Cleansing the soul with knowledge."),
        Q("The Kaaba can be read symbolically as…", ["The spiritual centre the heart turns to", "A market", "A fortress", "A library"], 0, "An illustrative inner meaning."),
        Q("In Shia thought, guidance in ta'wil is linked to…", ["The Imam of the time", "Any reader", "Kings", "Poets"], 0, "The Imam is the custodian of meaning."),
        Q("Ismaili teachers who taught ta'wil were called…", ["Da'is", "Sultans", "Viziers", "Qadis"], 0, "Da'is, teachers of the da'wa."),
        Q("How was ta'wil taught historically?", ["In stages, step by step", "All at once", "Never taught", "Only in writing"], 0, "In stages as understanding grew."),
        Q("Is ta'wil personal guesswork?", ["No — it is connected to the Imam's teaching", "Yes", "Sometimes", "Only for poets"], 0, "Not guesswork."),
        Q("The Verse of Light is in which sura and verse?", ["24:35", "2:255", "1:1", "112:1"], 0, "Surat al-Nur, 24:35."),
        Q("The Verse of Light describes God as light of…", ["The heavens and the earth", "The moon", "The desert", "The sea"], 0, "Light of the heavens and the earth."),
        Q("The lamp in the Verse of Light is within…", ["A glass", "A box", "A cave", "A tent"], 0, "A lamp within a glass."),
        Q("Ismaili commentators read the light as…", ["The light of guidance of Prophet and Imams", "Sunlight only", "Fire", "Electricity"], 0, "The light of guidance."),
        Q("Who is seen as custodian of the Qur'an's meaning in Shia thought?", ["Hazrat Ali and the Imams", "Any caliph", "Scholars only", "No one"], 0, "Ali and the Imams."),
        Q("Ta'wil's root idea is returning to…", ["The first / origin", "The end", "The middle", "The surface"], 0, "Back to the first."),
        Q("Which is an outward image, per the lesson?", ["A lamp", "Guidance", "Knowledge", "Purity"], 0, "The lamp is the image; guidance the meaning."),
        Q("Ta'wil works on…", ["Scripture and religious practices", "Only numbers", "Only poetry", "Only law"], 0, "Texts and practices."),
        Q("Nasir Khusraw wrote Wajh-i Din in…", ["Persian", "Latin", "Greek", "Chinese"], 0, "In Persian."),
        Q("Why teach ta'wil in stages?", ["Understanding grows gradually", "It was secret forever", "To confuse", "It had no content"], 0, "Step by step growth."),
        Q("Which tab lets you search 'ta'wil' questions?", ["Explore", "Impact", "Play", "Imams"], 0, "Explore has the Q&A."),
        Q("Ta'wil connects most closely to which pair?", ["Zahir and batin", "Din and dunya", "Ilm and amal", "Satr and kashf"], 0, "It moves from zahir to batin."),
        Q("The inner meaning of a lamp in the verse is…", ["Guidance", "Oil", "Glass", "A tree"], 0, "Guidance.")
    ]

    // MARK: Chapter 5 — Imamat
    static let ch5: [QuizQuestion] = [
        Q("Who was the first Imam?", ["Hazrat Ali", "Imam Husayn", "Imam Isma'il", "Imam al-Mu'izz"], 0, "Hazrat Ali."),
        Q("The Imams descend from the Prophet through…", ["Hazrat Ali and Bibi Fatima", "Abu Bakr", "Umar", "Uthman"], 0, "Through Ali and Fatima."),
        Q("'Hazar Imam' means…", ["Present Imam", "Thousand Imams", "First Imam", "Hidden Imam"], 0, "The present, living Imam."),
        Q("When did Aga Khan V become Imam?", ["4 February 2025", "1957", "1885", "2015"], 0, "4 February 2025."),
        Q("Aga Khan V is the Imam number…", ["50", "49", "48", "46"], 0, "The 50th Imam."),
        Q("How was Aga Khan V designated?", ["Through his father's will (nass)", "By election", "By a council", "By lottery"], 0, "Nass via his father's will."),
        Q("Where did Ghadir Khumm take place?", ["On the route back from the Prophet's final pilgrimage", "In Cairo", "In Alamut", "In Bombay"], 0, "Returning from the final pilgrimage."),
        Q("In what year was Ghadir Khumm?", ["632 CE", "909 CE", "1094 CE", "1818 CE"], 0, "632 CE."),
        Q("At Ghadir Khumm the Prophet raised whose hand?", ["Hazrat Ali's", "Abu Bakr's", "Imam Husayn's", "Salman's"], 0, "Hazrat Ali's."),
        Q("Shia Muslims understand Ghadir Khumm as…", ["Designation of Ali as successor", "A trade deal", "A battle", "A wedding"], 0, "The designation of Ali."),
        Q("'Satr' refers to…", ["Periods of concealment", "Periods of rule", "A prayer", "A book"], 0, "Satr means concealment."),
        Q("Which Imams ruled openly as caliphs?", ["The Fatimid Imams", "The Alamut Imams only", "None", "Only Aga Khan III"], 0, "The Fatimid Imam-caliphs."),
        Q("Who carried the message far from the Imam's residence?", ["Da'is and pirs", "Soldiers", "Merchants only", "Kings"], 0, "Da'is and pirs."),
        Q("Pir Sadr al-Din is known for…", ["Composing ginans", "Founding Cairo", "Building Alamut", "Writing Safarnama"], 0, "Devotional hymns in South Asia."),
        Q("Ginans are…", ["Devotional hymns", "Laws", "Coins", "Buildings"], 0, "Devotional hymns."),
        Q("Has the Imamat been interrupted?", ["No — it has continued without break", "Yes, many times", "Only once", "Unknown"], 0, "Continuous, though sometimes hidden."),
        Q("Besides interpreting faith, the Imam cares for…", ["Quality of life of the community and societies", "Only rituals", "Only history", "Nothing else"], 0, "Spiritual and worldly well-being."),
        Q("'Mawla' in the Ghadir declaration is understood by Shia as…", ["Master / guardian", "Stranger", "Servant", "Merchant"], 0, "Spiritual master or guardian."),
        Q("Why did Imams sometimes live in concealment?", ["Danger and persecution", "Boredom", "Travel", "Illness"], 0, "For safety."),
        Q("Ismailis follow…", ["A living, present Imam", "A hidden Imam only", "No Imam", "Twelve Imams only"], 0, "A living Imam."),
        Q("Bibi Fatima was the Prophet's…", ["Daughter", "Wife", "Sister", "Aunt"], 0, "His daughter."),
        Q("Who was Imam Husayn's father?", ["Hazrat Ali", "Imam Ja'far al-Sadiq", "Imam Isma'il", "Imam al-Mahdi"], 0, "Imam Husayn was the son of Hazrat Ali and Bibi Fatima."),
        Q("The institution of Imams is called…", ["Imamat", "Caliphate", "Sultanate", "Papacy"], 0, "Imamat.")
    ]
}
