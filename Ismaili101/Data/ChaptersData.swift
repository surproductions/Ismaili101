import Foundation

// Educational content. Wording is introductory and should be reviewed by
// community educators (e.g. your local ITREB / ITREC) before publishing.

enum ChaptersData {
    /// Core chapters 1–10 plus philosophy chapters 11–14, with "Go deeper" lessons attached.
    static let all: [Chapter] = (core + PhilosophyChapters.all).map { chapter in
        var chapter = chapter
        if chapter.lessons.isEmpty {
            chapter.lessons = ChapterLessons.byChapter[chapter.id] ?? []
        }
        return chapter
    }

    private static let core: [Chapter] = [
        Chapter(
            id: 1,
            title: "Din & Dunya",
            subtitle: "The core framework: faith and world together",
            symbol: "circle.lefthalf.filled",
            overview: [
                "Din means faith; dunya means the world we live in. In Ismaili thought these are not rivals. Faith shapes how we live in the world, and how we live in the world is part of our faith.",
                "The Imams have repeatedly encouraged the community to pursue education, build institutions, care for the environment and improve quality of life — all as expressions of faith, not distractions from it.",
                "The bridge between the two is intellect: using reason and good judgement to apply ethical principles to real situations."
            ],
            keyTerms: [
                KeyTerm(term: "Din", definition: "Faith or religion — the spiritual and ethical dimension of life."),
                KeyTerm(term: "Dunya", definition: "The material world and everyday life: work, family, society."),
                KeyTerm(term: "Tariqah", definition: "Literally 'path'. Ismailis describe their interpretation of Islam as a Tariqah within Shia Islam.")
            ],
            quiz: [
                QuizQuestion(prompt: "In Ismaili thought, how do din and dunya relate?",
                             options: ["They are opposites", "They are complementary", "Dunya should be avoided", "Din only concerns ritual"],
                             correctIndex: 1,
                             explanation: "Faith and worldly life are seen as two dimensions of one balanced life."),
                QuizQuestion(prompt: "What helps us bridge faith and everyday decisions?",
                             options: ["Intellect and ethical judgement", "Avoiding society", "Wealth", "Luck"],
                             correctIndex: 0,
                             explanation: "Reason ('aql) lets us apply ethical principles wisely in changing circumstances.")
            ]
        ),
        Chapter(
            id: 2,
            title: "Intellect & the Soul",
            subtitle: "'Aql, nafs and the soul's journey",
            symbol: "brain.head.profile",
            overview: [
                "Classical Ismaili thinkers such as Abu Ya'qub al-Sijistani and Hamid al-Din al-Kirmani described creation through a philosophical language shared with Neoplatonism.",
                "God is beyond all description. From God's command comes the Universal Intellect ('Aql al-Kull), and from it the Universal Soul (Nafs al-Kull), which animates the cosmos.",
                "Each human soul is pictured as a traveller: through knowledge, ethical action and remembrance it moves from potential toward actualised understanding."
            ],
            keyTerms: [
                KeyTerm(term: "'Aql", definition: "Intellect or reason — the faculty that recognises truth and guides action."),
                KeyTerm(term: "Universal Intellect", definition: "In classical Ismaili cosmology, the first originated being, brought forth by God's command."),
                KeyTerm(term: "Nafs", definition: "Soul. The individual soul is seen as on a journey of growth toward its source.")
            ],
            quiz: [
                QuizQuestion(prompt: "In classical Ismaili cosmology, what is the first originated being?",
                             options: ["The Universal Soul", "The Universal Intellect", "The physical world", "Time"],
                             correctIndex: 1,
                             explanation: "Thinkers like al-Sijistani placed the Universal Intellect first, followed by the Universal Soul."),
                QuizQuestion(prompt: "How is the individual soul often described?",
                             options: ["As fixed and unchanging", "As a traveller growing in understanding", "As unimportant", "As purely physical"],
                             correctIndex: 1,
                             explanation: "The soul's journey is one of growth through knowledge, ethics and remembrance.")
            ]
        ),
        Chapter(
            id: 3,
            title: "Zahir & Batin",
            subtitle: "Outer form, inner meaning",
            symbol: "eye.circle.fill",
            overview: [
                "Everything has an outward aspect (zahir) and an inward aspect (batin). A ritual, a verse of the Qur'an or an event in nature has a visible form and a deeper meaning.",
                "Ismaili tradition holds that both matter. The outer form is the doorway; the inner meaning is what the form points toward.",
                "Think of a word: its letters are the zahir, and the idea it carries is the batin. You need the letters to reach the idea."
            ],
            keyTerms: [
                KeyTerm(term: "Zahir", definition: "The exoteric — outward, apparent, literal dimension."),
                KeyTerm(term: "Batin", definition: "The esoteric — inner, spiritual dimension that the outward form points toward."),
                KeyTerm(term: "Symbol", definition: "Something visible that carries a meaning beyond itself.")
            ],
            quiz: [
                QuizQuestion(prompt: "What does batin refer to?",
                             options: ["The outward form", "The inner meaning", "A type of prayer", "A historical period"],
                             correctIndex: 1,
                             explanation: "Batin is the inner, spiritual dimension."),
                QuizQuestion(prompt: "In the 'word' analogy, what are the letters?",
                             options: ["The batin", "The zahir", "Neither", "The ta'wil"],
                             correctIndex: 1,
                             explanation: "Letters are the visible form (zahir) that carries the meaning (batin).")
            ]
        ),
        Chapter(
            id: 4,
            title: "The Art of Ta'wil",
            subtitle: "Leading meaning back to its origin",
            symbol: "key.fill",
            overview: [
                "Ta'wil comes from an Arabic root meaning 'to bring back to the first'. It is the practice of interpreting outward forms to reach their inner meaning.",
                "Classical works such as Nasir Khusraw's Wajh-i Din give inner meanings to ritual acts — for example, ablution as purifying the soul through knowledge.",
                "Illustratively, the Kaaba can be read as a symbol of the spiritual centre toward which the heart turns. In Shia tradition, guidance in ta'wil is linked to the Imam of the time."
            ],
            keyTerms: [
                KeyTerm(term: "Ta'wil", definition: "Esoteric interpretation — leading an outward form back to its original, inner meaning."),
                KeyTerm(term: "Tanzil", definition: "Revelation — the 'sending down' of the outward text."),
                KeyTerm(term: "Wajh-i Din", definition: "'The Face of Religion', a Persian work by Nasir Khusraw explaining inner meanings of practices.")
            ],
            quiz: [
                QuizQuestion(prompt: "Ta'wil literally relates to…",
                             options: ["Bringing back to the origin", "Translating into Persian", "Memorising text", "Writing history"],
                             correctIndex: 0,
                             explanation: "The root meaning is to return something to its first source."),
                QuizQuestion(prompt: "Who wrote Wajh-i Din?",
                             options: ["Al-Kirmani", "Nasir Khusraw", "Ibn Sina", "Rumi"],
                             correctIndex: 1,
                             explanation: "Nasir Khusraw, the 11th-century Persian poet, philosopher and da'i.")
            ]
        ),
        Chapter(
            id: 5,
            title: "The Institution of Imamat",
            subtitle: "Continuity of guidance through history",
            symbol: "crown.fill",
            overview: [
                "Shia Muslims believe that after the Prophet Muhammad, spiritual authority passed to Hazrat Ali and then to designated Imams from his and Bibi Fatima's descendants.",
                "Ismailis follow a living, present Imam. Each Imam designates his successor (nass). Today the 50th Imam is His Highness Prince Rahim Aga Khan V, who succeeded his father on 4 February 2025.",
                "The Imam interprets the faith for his time and also cares for the quality of life of the community and the societies in which it lives."
            ],
            keyTerms: [
                KeyTerm(term: "Imam", definition: "Spiritual leader; in Ismaili belief a direct descendant of the Prophet through Hazrat Ali and Bibi Fatima."),
                KeyTerm(term: "Nass", definition: "Designation of the next Imam by the current Imam."),
                KeyTerm(term: "Hazar Imam", definition: "'Present Imam' — the living Imam of the time.")
            ],
            quiz: [
                QuizQuestion(prompt: "How is the next Imam chosen?",
                             options: ["Election", "Designation (nass) by the Imam", "A council vote", "By age alone"],
                             correctIndex: 1,
                             explanation: "Succession is by nass — designation by the current Imam."),
                QuizQuestion(prompt: "Who is the 50th (present) Imam?",
                             options: ["Aga Khan III", "Aga Khan IV", "Aga Khan V", "Aga Khan I"],
                             correctIndex: 2,
                             explanation: "Prince Rahim Aga Khan V became Imam on 4 February 2025.")
            ]
        ),
        Chapter(
            id: 6,
            title: "Remembrance & Daily Life",
            subtitle: "Dhikr, du'a and personal search",
            symbol: "sparkles",
            overview: [
                "Remembrance of God (dhikr) is central to Ismaili practice. It ranges from communal prayer to quiet personal reflection.",
                "Ismailis recite the Du'a in the jamatkhana, traditionally at the morning, evening and night times. Personal meditation and prayer complement it.",
                "Practice is not limited to ritual: honesty at work, kindness at home and service to others are also forms of remembrance."
            ],
            keyTerms: [
                KeyTerm(term: "Dhikr", definition: "Remembrance of God through recitation, reflection or meditation."),
                KeyTerm(term: "Du'a", definition: "Prayer; for Ismailis also the specific prayer recited in the jamatkhana."),
                KeyTerm(term: "Jamatkhana", definition: "'House of the community' — the Ismaili space for prayer and gathering.")
            ],
            quiz: [
                QuizQuestion(prompt: "What does dhikr mean?",
                             options: ["Fasting", "Remembrance", "Charity", "Pilgrimage"],
                             correctIndex: 1,
                             explanation: "Dhikr is remembrance of God."),
                QuizQuestion(prompt: "What is a jamatkhana?",
                             options: ["A school only", "A space for prayer and community gathering", "A library", "A market"],
                             correctIndex: 1,
                             explanation: "It is the community's place of prayer and gathering.")
            ]
        ),
        Chapter(
            id: 7,
            title: "Science, Reason & Evolution",
            subtitle: "Two ways of reading one creation",
            symbol: "atom",
            overview: [
                "Ismaili history is rich in scientific culture: Fatimid Cairo's Dar al-'Ilm, the libraries of Alamut, and scholars like Nasir al-Din al-Tusi, who worked for years among the Nizaris.",
                "The Imams have consistently described faith and reason as complementary. Studying nature is one way of contemplating God's creation.",
                "Because ta'wil reads scripture symbolically as well as literally, many Ismailis see no conflict between creation narratives and scientific accounts such as evolution."
            ],
            keyTerms: [
                KeyTerm(term: "Dar al-'Ilm", definition: "'House of Knowledge', founded in Cairo in 1005 under Imam al-Hakim."),
                KeyTerm(term: "Nasir al-Din al-Tusi", definition: "13th-century polymath and astronomer who spent years in Nizari fortresses in Persia."),
                KeyTerm(term: "Symbolic reading", definition: "Interpreting a text for its meaning rather than only its literal surface.")
            ],
            quiz: [
                QuizQuestion(prompt: "Which Imam founded the Dar al-'Ilm in Cairo?",
                             options: ["Al-Mu'izz", "Al-Hakim", "Al-Mustansir", "Nizar"],
                             correctIndex: 1,
                             explanation: "Imam al-Hakim founded it in 1005."),
                QuizQuestion(prompt: "Why do many Ismailis see no conflict with evolution?",
                             options: ["They ignore scripture", "Scripture can be read symbolically", "Science is forbidden", "Evolution is in the Du'a"],
                             correctIndex: 1,
                             explanation: "The tradition of ta'wil leaves room for symbolic as well as literal readings.")
            ]
        ),
        Chapter(
            id: 8,
            title: "Inclusive Ethics & 'Adl",
            subtitle: "Dignity for every person",
            symbol: "hands.and.sparkles.fill",
            overview: [
                "'Adl means justice, and divine justice includes fairness to every soul in its own circumstances. No one's worth depends on their abilities.",
                "People who are neurodivergent or live with physical limitations carry the same dignity as anyone else. Each person is responsible according to their capacity.",
                "An inclusive community removes barriers — in buildings, in language and in attitudes — so everyone can take part in prayer, learning and service."
            ],
            keyTerms: [
                KeyTerm(term: "'Adl", definition: "Justice; divine justice that is fair to each person's situation."),
                KeyTerm(term: "Karama", definition: "Human dignity, which belongs to every person."),
                KeyTerm(term: "Inclusion", definition: "Designing communities so that everyone can fully participate.")
            ],
            quiz: [
                QuizQuestion(prompt: "What does 'adl mean?",
                             options: ["Charity", "Justice", "Prayer", "Knowledge"],
                             correctIndex: 1,
                             explanation: "'Adl is justice."),
                QuizQuestion(prompt: "Does a person's dignity depend on their abilities?",
                             options: ["Yes", "No"],
                             correctIndex: 1,
                             explanation: "Dignity belongs to every person regardless of ability.")
            ]
        ),
        Chapter(
            id: 9,
            title: "Titles, Diplomacy & History",
            subtitle: "From Fatimid caliphs to the Seat of the Imamat",
            symbol: "building.columns.fill",
            overview: [
                "The Fatimids (909–1171) were Ismaili Imam-caliphs. Their state, founded in North Africa, moved its capital to the newly built city of Cairo.",
                "The title 'Aga Khan' was granted to the 46th Imam, Hasan Ali Shah, by the Qajar Shah of Persia around 1818 and has been inherited by each successor.",
                "The Ismaili Imamat has signed agreements with several governments. In 2015 Portugal and the Imamat agreed to establish the Seat of the Ismaili Imamat in Lisbon."
            ],
            keyTerms: [
                KeyTerm(term: "Fatimids", definition: "Ismaili dynasty of Imam-caliphs named after Bibi Fatima, the Prophet's daughter."),
                KeyTerm(term: "Aga Khan", definition: "Honorific title first granted by the Shah of Persia c. 1818; inherited by successive Imams."),
                KeyTerm(term: "Seat of the Imamat", definition: "The Imamat's official seat, established in Lisbon under a 2015 agreement with Portugal.")
            ],
            quiz: [
                QuizQuestion(prompt: "Who first granted the title 'Aga Khan'?",
                             options: ["The Ottoman Sultan", "The Shah of Persia", "Queen Victoria", "The Mughal Emperor"],
                             correctIndex: 1,
                             explanation: "Fath Ali Shah Qajar of Persia, around 1818."),
                QuizQuestion(prompt: "Where is the Seat of the Ismaili Imamat?",
                             options: ["Paris", "Cairo", "Lisbon", "Karachi"],
                             correctIndex: 2,
                             explanation: "Lisbon, under a 2015 agreement with Portugal.")
            ]
        ),
        Chapter(
            id: 10,
            title: "Pluralism & Global Ethics",
            subtitle: "Service in a diverse world",
            symbol: "person.3.fill",
            overview: [
                "Pluralism means not just tolerating difference but valuing it. The Imamat founded the Global Centre for Pluralism in Ottawa with the Government of Canada.",
                "Khidmat — voluntary service — is a hallmark of Ismaili communities. Volunteers run much of jamati life and support AKDN programmes.",
                "AKDN agencies serve people regardless of faith, origin or gender, reflecting the ethic that service is owed to all of humanity."
            ],
            keyTerms: [
                KeyTerm(term: "Pluralism", definition: "Valuing human diversity as a strength, not just tolerating it."),
                KeyTerm(term: "Khidmat", definition: "Voluntary service offered for the good of others."),
                KeyTerm(term: "Global Centre for Pluralism", definition: "Ottawa-based centre founded by the Aga Khan with the Government of Canada.")
            ],
            quiz: [
                QuizQuestion(prompt: "What is khidmat?",
                             options: ["A tax", "Voluntary service", "A festival", "A book"],
                             correctIndex: 1,
                             explanation: "Khidmat is voluntary service."),
                QuizQuestion(prompt: "Whom do AKDN agencies serve?",
                             options: ["Only Ismailis", "People regardless of faith, origin or gender", "Only governments", "Only donors"],
                             correctIndex: 1,
                             explanation: "AKDN programmes are open to all.")
            ]
        )
    ]
}
