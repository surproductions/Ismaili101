import Foundation

// Faith & Science: real discoveries, verses that inspired inquiry, the "scientific miracles"
// debate presented fairly, and how Ismaili thought fits with modern science.

enum FaithScienceData {

    // MARK: Part 1 — Real discoveries and inventions

    static let discoveries: [Discovery] = [
        Discovery(title: "Algebra", person: "Muhammad ibn Musa al-Khwarizmi", when: "c. 820 CE", place: "Baghdad",
                  field: .maths,
                  text: "His book al-Jabr gave algebra its name and its first systematic methods for solving equations. His work also helped bring the Hindu–Arabic numerals — 0 to 9 — to Europe.",
                  lastingImpact: "The word 'algorithm' comes from the Latin form of his name. Every computer program runs on algorithms."),
        Discovery(title: "How we see: the science of optics", person: "Ibn al-Haytham (Alhazen)", when: "c. 1011–1021", place: "Fatimid Cairo",
                  field: .physics,
                  text: "His Book of Optics showed that we see because light travels from objects into the eye — not, as many Greeks thought, because the eye sends out rays. He studied the camera obscura and tested his ideas with careful, repeatable experiments.",
                  lastingImpact: "Often called a pioneer of the scientific method; his book shaped European science for centuries.",
                  ismailiLink: "He did this work in Cairo during the reign of the Fatimid Imam al-Hakim."),
        Discovery(title: "Star tables good enough for modern astronomers", person: "Ibn Yunus", when: "c. 990–1007", place: "Fatimid Cairo",
                  field: .astronomy,
                  text: "Working from an observatory near Cairo, he compiled the great Hakimi Zij — astronomical tables — and recorded eclipses with great precision.",
                  lastingImpact: "Centuries later, astronomers such as Simon Newcomb used his eclipse records to study how the Moon's motion changes over time. A crater on the Moon is named after him.",
                  ismailiLink: "Court astronomer to the Fatimid Imams al-Aziz and al-Hakim; the tables are dedicated to al-Hakim."),
        Discovery(title: "Measuring the Earth from a mountain", person: "Abu Rayhan al-Biruni", when: "11th century", place: "Today's Pakistan",
                  field: .geography,
                  text: "He climbed a mountain, measured its height, then measured how far the horizon dipped below level — and used trigonometry to calculate the Earth's radius.",
                  lastingImpact: "His result is often quoted as about 6,340 km — close to the modern 6,371 km. Historians debate how precise his measurement could really have been, but the method was brilliant."),
        Discovery(title: "The Canon of Medicine", person: "Ibn Sina (Avicenna)", when: "c. 1025", place: "Persia",
                  field: .medicine,
                  text: "An encyclopedia of medicine covering diseases, drugs and treatments, including ideas about contagion and testing medicines.",
                  lastingImpact: "Used as a medical textbook in European universities for centuries."),
        Discovery(title: "Telling smallpox from measles", person: "Abu Bakr al-Razi (Rhazes)", when: "c. 900", place: "Baghdad",
                  field: .medicine,
                  text: "Wrote one of the first careful descriptions distinguishing smallpox from measles, and ran a hospital in Baghdad.",
                  lastingImpact: "A landmark in clinical observation."),
        Discovery(title: "Surgery and surgical tools", person: "Abu al-Qasim al-Zahrawi (Abulcasis)", when: "c. 1000", place: "Córdoba, Spain",
                  field: .medicine,
                  text: "His encyclopedia al-Tasrif included a major section on surgery with drawings of some 200 surgical instruments, many designed by him.",
                  lastingImpact: "Translated into Latin and used by European surgeons for centuries."),
        Discovery(title: "How blood flows through the lungs", person: "Ibn al-Nafis", when: "1242", place: "Damascus and Cairo",
                  field: .medicine,
                  text: "He described pulmonary circulation — blood passing from the heart through the lungs to pick up air — correcting the ancient Greek physician Galen.",
                  lastingImpact: "European anatomists described the same thing about 300 years later."),
        Discovery(title: "The Tusi couple", person: "Nasir al-Din al-Tusi", when: "13th century", place: "Persia",
                  field: .astronomy,
                  text: "A clever geometric device — one circle rolling inside another — that produces straight-line motion from circular motions. He used it to improve models of the planets.",
                  lastingImpact: "The same device appears in Copernicus's famous 1543 book on the solar system. He later founded the great observatory at Maragha (1259).",
                  ismailiLink: "Al-Tusi spent years among the Nizari Ismailis, using the libraries of their fortresses, where he wrote his ethics book Akhlaq-i Nasiri."),
        Discovery(title: "An encyclopedia of the sciences", person: "The Brethren of Purity (Ikhwan al-Safa')", when: "10th century", place: "Basra, Iraq",
                  field: .learning,
                  text: "Fifty-two epistles covering mathematics, astronomy, music, natural science, philosophy and religion — written to show that all knowledge leads toward understanding God.",
                  ismailiLink: "Many scholars link the Epistles to an Ismaili intellectual setting."),
        Discovery(title: "The House of Knowledge", person: "Fatimid Imam al-Hakim", when: "1005", place: "Fatimid Cairo",
                  field: .learning,
                  text: "The Dar al-'Ilm opened its library to the public, with teaching in law, grammar, medicine, astronomy and more — and supplies of paper and ink for students.",
                  ismailiLink: "Founded by the 16th Ismaili Imam."),
        Discovery(title: "The world's oldest operating university", person: "Fatima al-Fihri", when: "859", place: "Fez, Morocco",
                  field: .learning,
                  text: "She used her inheritance to found the Qarawiyyin mosque, which grew into a centre of learning.",
                  lastingImpact: "Often described as the oldest continuously operating university in the world."),
        Discovery(title: "Astrolabes: the first pocket computers", person: "Maryam al-'Ijliya", when: "10th century", place: "Aleppo, Syria",
                  field: .astronomy,
                  text: "A celebrated maker of astrolabes — instruments for telling time, finding direction and tracking the stars — for the ruler of Aleppo.",
                  lastingImpact: "Asteroid 7060 Al-'Ijliya, discovered in 1990, is named after her."),
        Discovery(title: "Machines and robots", person: "Ismail al-Jazari", when: "1206", place: "Upper Mesopotamia",
                  field: .engineering,
                  text: "His Book of Knowledge of Ingenious Mechanical Devices describes water clocks, pumps and programmable automata — including the famous Elephant Clock.",
                  lastingImpact: "Admired today as an early landmark in mechanical engineering and robotics."),
        Discovery(title: "A map of the known world", person: "Muhammad al-Idrisi", when: "1154", place: "Sicily",
                  field: .geography,
                  text: "For King Roger II of Sicily he produced one of the most detailed world maps of the Middle Ages, with a book describing the lands on it.",
                  lastingImpact: "Used and copied for centuries."),
        Discovery(title: "Hospitals for everyone", person: "Many cities and rulers", when: "9th–13th centuries", place: "Baghdad, Damascus, Cairo",
                  field: .medicine,
                  text: "Large public hospitals (bimaristans) treated patients regardless of wealth, with separate wards, pharmacies and medical teaching.",
                  lastingImpact: "An early model of the teaching hospital.")
    ]

    // MARK: Part 2 — Verses that inspired inquiry

    static let verses: [InspiringVerse] = [
        InspiringVerse(reference: "Qur'an 96:1–5", text: "Read, in the name of your Lord who created… who taught by the pen, taught humankind what it did not know.",
                       note: "Traditionally the first words revealed to the Prophet — a command to read and learn."),
        InspiringVerse(reference: "Qur'an 3:190–191", text: "In the creation of the heavens and the earth, and the alternation of night and day, there are signs for people of understanding — who reflect on creation.",
                       note: "Nature is described as full of 'signs' to study and think about."),
        InspiringVerse(reference: "Qur'an 88:17–20", text: "Do they not look at the camels, how they are created? And at the sky, how it is raised? And at the mountains, how they are set? And at the earth, how it is spread out?",
                       note: "An invitation to observe the natural world closely."),
        InspiringVerse(reference: "Qur'an 20:114", text: "Say: My Lord, increase me in knowledge.",
                       note: "A prayer for knowledge, recited by Muslims to this day."),
        InspiringVerse(reference: "Qur'an 39:9", text: "Are those who know equal to those who do not know?",
                       note: "Knowledge is valued as a mark of human excellence.")
    ]

    // MARK: Part 3 — The "scientific miracles" debate

    static let debated: [DebatedClaim] = [
        DebatedClaim(reference: "Qur'an 21:30", topic: "The Big Bang?",
                     verse: "The heavens and the earth were joined together, and We split them apart.",
                     supporters: "This sounds strikingly like the universe beginning from a single state and separating — something science only described in the 20th century.",
                     critics: "Many ancient creation stories describe heaven and earth being separated. Classical commentators read the verse in other ways, such as rain splitting from the sky and plants from the earth."),
        DebatedClaim(reference: "Qur'an 51:47", topic: "An expanding universe?",
                     verse: "We built the heaven with might, and We are surely expanding it (or: We are vast in power).",
                     supporters: "The Arabic word can mean 'expanding', which matches the discovery in the 1920s that the universe is growing.",
                     critics: "The same word is often translated 'vast' or 'able'. The 'expanding' reading became popular only after the scientific discovery."),
        DebatedClaim(reference: "Qur'an 23:12–14", topic: "Human development in the womb?",
                     verse: "We created the human from a drop, then a clinging form, then a lump, then bones clothed with flesh.",
                     supporters: "The stages seem to match what embryology later observed.",
                     critics: "Similar descriptions existed in Greek medicine (Galen) before the Qur'an, and some stages don't line up neatly with modern embryology."),
        DebatedClaim(reference: "Qur'an 55:19–20", topic: "A barrier between seas?",
                     verse: "He let the two seas meet; between them is a barrier they do not cross.",
                     supporters: "Where rivers meet seas, or seas meet each other, the waters can stay distinct for a while because of differences in salt and density.",
                     critics: "Sailors and fishermen have long observed this; it isn't hidden knowledge. The waters do mix over time.")
    ]

    static let debateTakeaway = [
        "Many people find these parallels meaningful, and they are a real part of how some Muslims talk about faith and science.",
        "But they are not scientific proof. The verses are poetic and can be read in several ways, and the 'scientific' readings usually appear after a discovery is made. Tying faith to particular scientific theories also makes it fragile, because science keeps changing.",
        "The Ismaili tradition takes a different path. It reads scripture for its inner meaning (ta'wil), not as a science textbook, and sees faith and science as complementary ways of understanding one creation."
    ]

    // MARK: Part 4 — How it fits together

    static let fitsWith: [Lesson] = [
        Lesson(heading: "No conflict with the Big Bang or evolution", symbol: "checkmark.seal.fill", body: [
            "Because Ismaili thought reads creation stories for their meaning, it does not need the universe to be young or species to be fixed. Creation as 'origination' (ibda') is timeless; science describes how the physical world has unfolded in time.",
            "Classical Ismaili cosmology even pictured creation rising in stages — minerals, plants, animals, humans — long before modern biology."
        ]),
        Lesson(heading: "Faith and science answer different questions", symbol: "arrow.left.arrow.right", body: [
            "Science asks how: how stars form, how life evolves, how the brain works. It does this brilliantly.",
            "Some questions lie outside what experiments can settle: Why is there something rather than nothing? What makes a life meaningful? Why should we be good? Religion and philosophy are attempts to answer these."
        ]),
        Lesson(heading: "Scientists of faith", symbol: "person.2.fill", body: [
            "Many great scientists have been religious. Georges Lemaître, the Belgian physicist who first proposed what became the Big Bang theory, was a Catholic priest.",
            "Muslim scientists have won Nobel Prizes too: physicist Abdus Salam (1979), and chemists Ahmed Zewail (1999) and Aziz Sancar (2015)."
        ]),
        Lesson(heading: "Talking with friends who don't believe", symbol: "bubble.left.and.bubble.right.fill", body: [
            "Science cannot prove God, and it cannot disprove God either. Good conversations come from curiosity, not from trying to win.",
            "Share what you find meaningful, listen to what they find convincing, and respect each other's honesty. Understanding is a worthy goal in itself."
        ], reflection: "What do I find meaningful about faith that I could share — without needing anyone to agree?")
    ]
}
