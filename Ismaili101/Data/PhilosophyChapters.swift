import Foundation

// Chapters 11–14: classical Ismaili philosophy of God, the soul and the Imam,
// centred on Pir Nasir Khusraw. Introductory wording — review with educators.

enum PhilosophyChapters {
    static let all: [Chapter] = [
        Chapter(
            id: 11,
            title: "Pir Nasir Khusraw",
            subtitle: "Philosopher, poet and traveller of the soul",
            symbol: "figure.hiking",
            overview: [
                "Nasir Khusraw was born in 1004 in Qubadiyan, in Central Asia. He worked as an official in government service and lived comfortably — until, at around forty, he began searching seriously for truth.",
                "He set out on a seven-year journey that took him to Mecca and to Fatimid Cairo, where he spent about three years during the Imamat of al-Mustansir bi'llah. He returned east as the hujjat, the chief teacher of the Ismaili da'wa in Khurasan.",
                "Persecuted for his beliefs, he spent his final years in exile in the mountains of Badakhshan. There he wrote much of his philosophy and poetry. Ismailis of Central Asia honour him as Pir, and his teachings are still recited today."
            ],
            keyTerms: [
                KeyTerm(term: "Pir", definition: "A revered spiritual teacher and guide, appointed to teach the faith."),
                KeyTerm(term: "Hujjat", definition: "'Proof' — a senior rank of teacher in the Fatimid da'wa, responsible for a whole region."),
                KeyTerm(term: "Safarnama", definition: "Nasir Khusraw's 'Book of Travels', describing his seven-year journey, including life in Fatimid Cairo.")
            ],
            quiz: [
                QuizQuestion(prompt: "Where did Nasir Khusraw spend about three years?",
                             options: ["Baghdad", "Fatimid Cairo", "Alamut", "Delhi"], correctIndex: 1,
                             explanation: "He lived in Cairo during the Imamat of al-Mustansir bi'llah."),
                QuizQuestion(prompt: "What does Jami' al-Hikmatayn bring together?",
                             options: ["Two empires", "Religious wisdom and philosophy", "Two languages", "Poetry and music"], correctIndex: 1,
                             explanation: "Its title means 'Harmonising the Two Wisdoms' — revealed religion and Greek philosophy."),
                QuizQuestion(prompt: "Where did he spend his final years?",
                             options: ["Cairo", "Badakhshan", "Mecca", "Isfahan"], correctIndex: 1,
                             explanation: "In exile in the mountains of Badakhshan, where he is still honoured as Pir.")
            ],
            lessons: [
                Lesson(heading: "The outer journey and the inner one", symbol: "map.fill", body: [
                    "Nasir Khusraw describes his life changing after a dream that urged him to stop wasting his days and seek wisdom. He left his post and set out walking.",
                    "His physical journey — thousands of miles across deserts and cities — mirrors the journey every soul makes: away from comfort and distraction, toward knowledge and the guide who can teach it.",
                    "In his thought, every outward thing has an inner counterpart. Even his travels became a symbol of the soul's search for its source."
                ], reflection: "What 'dream' or moment has made me want to search more deeply?"),
                Lesson(heading: "His books", symbol: "books.vertical.fill", body: [
                    "Safarnama — the Book of Travels — is a vivid eyewitness account of 11th-century cities, including the wealth and order of Fatimid Cairo.",
                    "Wajh-i Din, 'The Face of Religion', explains the inner meanings of religious practices. Zad al-Musafirin, 'Provisions for Travellers', explores the soul, the body and the life to come.",
                    "Jami' al-Hikmatayn, 'Harmonising the Two Wisdoms', shows how revealed religion and Greek philosophy can speak to each other. His Diwan of poetry carries the same ideas in verse."
                ]),
                Lesson(heading: "Reason as a gift from God", symbol: "brain.head.profile", body: [
                    "A theme that runs through Nasir Khusraw's poetry is praise of the intellect. He treats reason as one of God's greatest gifts and urges readers not to follow blindly, but to think.",
                    "For him, intellect and faith are partners. Reason helps us understand what religion teaches, and religious guidance shows reason where to look."
                ], reflection: "Do I treat my questions about faith as a problem, or as part of the journey?")
            ]
        ),
        Chapter(
            id: 12,
            title: "Tawhid",
            subtitle: "Knowing the God beyond description",
            symbol: "infinity",
            overview: [
                "Tawhid — the oneness of God — is the starting point of all Muslim faith. For Nasir Khusraw, a clear understanding of tawhid was the only true route to spiritual perfection.",
                "Classical Ismaili thinkers taught that God is beyond every category we can imagine: beyond being and non-being, beyond any quality that has an opposite. To describe God as 'big' or 'here' would be to limit God to human ideas.",
                "If God cannot be pictured, how do we relate to God? Through God's Word and command, through the intellect it brings forth, through guidance, and through remembrance and love."
            ],
            keyTerms: [
                KeyTerm(term: "Tawhid", definition: "The oneness and uniqueness of God."),
                KeyTerm(term: "Tanzih", definition: "Declaring God free of every limit, likeness or human description."),
                KeyTerm(term: "Amr (Kun)", definition: "God's command 'Be!', through which creation is originated.")
            ],
            quiz: [
                QuizQuestion(prompt: "Why did Ismaili thinkers avoid giving God attributes like 'big' or 'here'?",
                             options: ["They are rude", "They limit God to human concepts", "They are untrue for everything", "They are too short"], correctIndex: 1,
                             explanation: "Anything with an opposite would bind God to human categories."),
                QuizQuestion(prompt: "What does God's command 'Be!' originate first, in classical Ismaili thought?",
                             options: ["The Universal Intellect", "The stars", "Time", "The human body"], correctIndex: 0,
                             explanation: "The Universal Intellect, perfect in potential and actuality."),
                QuizQuestion(prompt: "For Nasir Khusraw, a clear grasp of tawhid is…",
                             options: ["Optional", "The route to spiritual perfection", "Only for scholars", "A historical topic"], correctIndex: 1,
                             explanation: "Understanding God's oneness was, for him, the path to perfection.")
            ],
            lessons: [
                Lesson(heading: "Beyond every description", symbol: "circle.dashed", body: [
                    "The 10th-century thinker Abu Ya'qub al-Sijistani used a striking method called double negation. God is not a thing — and also not 'not a thing'. Each negation strips away a limit, until the mind is left in humble silence before God.",
                    "This is not a way of saying God is distant or unknowable in every sense. It is a way of protecting the heart from worshipping an idea of God that we have made ourselves."
                ], reflection: "What pictures of God did I grow up with, and which of them might be too small?"),
                Lesson(heading: "The Word and the Intellect", symbol: "text.word.spacing", body: [
                    "Because God is beyond description, Ismaili thought speaks of God acting through the Word or command (amr): 'Be!' From that command comes the Universal Intellect, perfect and complete, closest to God in worshipful nearness.",
                    "So the closest the human mind can come to God is through intellect itself — the light of the first creation reflected in us. When we think clearly, love truth and seek knowledge, we are moving toward that light."
                ]),
                Lesson(heading: "A relationship of longing", symbol: "heart.fill", body: [
                    "A God beyond description is still a God who can be loved. Ismaili devotional poetry is full of yearning, remembrance and gratitude.",
                    "Worship, in this view, is the soul's response to God's generosity. Prayer, remembrance, learning and service are all ways of turning toward the source of our being."
                ], reflection: "When do I feel most drawn toward God — in prayer, in nature, in service?")
            ]
        ),
        Chapter(
            id: 13,
            title: "The Soul's Journey Home",
            subtitle: "Where we come from, and why we long to return",
            symbol: "arrow.uturn.up.circle.fill",
            overview: [
                "Nasir Khusraw taught that each human being has an individual intellect and soul that mirror the Universal Intellect and Universal Soul. Our souls come from a perfect, spiritual source.",
                "Yet in this world the human soul is not yet complete. It carries the potential for perfection — like a seed carries a tree — and its task is to grow into that potential through knowledge, guidance and good action.",
                "The longing many people feel for something beyond this world can be read as the soul's memory of where it came from: a homesickness for its origin, and a pull to return."
            ],
            keyTerms: [
                KeyTerm(term: "Ma'ad", definition: "'Return' — the soul's journey back toward its spiritual origin."),
                KeyTerm(term: "Zad", definition: "'Provisions' — the knowledge and good deeds the soul gathers for its journey."),
                KeyTerm(term: "Potential & actual", definition: "What the soul can become versus what it has already become.")
            ],
            quiz: [
                QuizQuestion(prompt: "According to Nasir Khusraw, our individual intellect and soul…",
                             options: ["Are unrelated to the Universals", "Mirror the Universal Intellect and Soul", "Are purely physical", "Are identical to God"], correctIndex: 1,
                             explanation: "They are smaller reflections of the Universal Intellect and Universal Soul."),
                QuizQuestion(prompt: "What best describes the human soul in this world?",
                             options: ["Finished and complete", "A seed carrying the potential for perfection", "Unable to change", "Not important"], correctIndex: 1,
                             explanation: "Its source is perfect; through knowledge it grows toward actual perfection."),
                QuizQuestion(prompt: "'Zad al-Musafirin' means…",
                             options: ["Light of the Soul", "Provisions for Travellers", "Book of Travels", "Face of Religion"], correctIndex: 1,
                             explanation: "The soul is a traveller, and knowledge and good deeds are its provisions.")
            ],
            lessons: [
                Lesson(heading: "Where did we come from?", symbol: "sparkles", body: [
                    "In the classical picture, God's command brings forth the Universal Intellect, perfect in every way. From the Intellect comes the Universal Soul — perfect in potential, but striving to become as complete as the Intellect. That striving sets the whole cosmos in motion.",
                    "Our own souls share in this story. They come from that higher world and feel, in small ways, the same longing the Universal Soul feels: to draw closer to the perfection above it.",
                    "This is why beauty, truth and kindness can move us so deeply. They remind the soul of home."
                ], reflection: "When have I felt a longing I couldn't explain? What might it have been pointing to?"),
                Lesson(heading: "Seed and tree", symbol: "tree.fill", body: [
                    "A seed is not a failure for not yet being a tree. Everything it needs is already inside it — but it must be planted, watered and given light.",
                    "Nasir Khusraw describes the human soul in a similar way. Its form is not yet perfect, but its potential is. Each person must recognise their own imperfections, correct them, and seek the closest possible relationship with God.",
                    "The 'water and light' for the soul are knowledge, guidance from a true teacher, worship performed with understanding, and good action in the world."
                ]),
                Lesson(heading: "Provisions for the traveller", symbol: "bag.fill", body: [
                    "Nasir Khusraw titled one of his major works Zad al-Musafirin — 'Provisions for Travellers'. The image is of the soul on a journey, and this world as a stop along the road.",
                    "A wise traveller doesn't spend the whole stay decorating the inn; they gather what they will need for the road ahead. For the soul, those provisions are knowledge and righteous deeds.",
                    "In Ismaili thought, resurrection and return are understood above all spiritually — the soul awakening to its true nature and returning toward its source."
                ], reflection: "What 'provisions' am I gathering this year that I could take anywhere?")
            ]
        ),
        Chapter(
            id: 14,
            title: "The Imam: Light of Guidance",
            subtitle: "The perfected intellect and soul as living guide",
            symbol: "sun.max.fill",
            overview: [
                "If every soul is a traveller, every traveller needs a guide. Ismailis believe God never leaves the world without one, and that this guide is the living Imam of the Time.",
                "Classical Ismaili thinkers taught that the Imam receives ta'yid — divine support — so that his intellect and soul are perfected and he can guide others. He is described as divinely inspired and as a bridge between the spiritual and physical worlds.",
                "This is why, in Ismaili thought, the soul's journey toward perfection is not made alone. The Imam's knowledge helps each seeker turn their potential into reality."
            ],
            keyTerms: [
                KeyTerm(term: "Ta'yid", definition: "Divine support or inspiration granted to the Prophet and the Imams."),
                KeyTerm(term: "Noor", definition: "Light — the light of guidance and Imamat that continues from one Imam to the next."),
                KeyTerm(term: "Ta'lim", definition: "Authoritative teaching, given by the Imam of the Time.")
            ],
            quiz: [
                QuizQuestion(prompt: "What is ta'yid?",
                             options: ["A tax", "Divine support granted to the Imam", "A type of poem", "A pilgrimage"], correctIndex: 1,
                             explanation: "Ta'yid is divine support that perfects the Imam's understanding."),
                QuizQuestion(prompt: "In Ismaili thought, why does a seeker need the Imam?",
                             options: ["To avoid thinking", "As a living guide who helps the soul actualise its potential", "Only for history", "For worldly wealth"], correctIndex: 1,
                             explanation: "The Imam's guidance helps the soul grow toward perfection."),
                QuizQuestion(prompt: "The 'lamps from one flame' image describes…",
                             options: ["Electricity", "The continuity of the Noor of Imamat", "Fatimid street lighting", "The stars"], correctIndex: 1,
                             explanation: "One light passes from Imam to Imam, though the lamps change.")
            ],
            lessons: [
                Lesson(heading: "Two worlds that mirror each other", symbol: "square.split.2x1.fill", body: [
                    "Nasir Khusraw taught that everything in the physical world points to a spiritual counterpart — its source or true form.",
                    "In the cosmos, the Universal Intellect is the light from which the rest of creation receives its order. In the human world, the Prophet and the Imams carry that light of intellect, so that human souls can receive it.",
                    "Seen this way, the Imam is not only a historical leader but the living point where spiritual light meets the physical world."
                ]),
                Lesson(heading: "Teaching for every age", symbol: "graduationcap.fill", body: [
                    "Circumstances change: new technologies, new societies, new questions. A guide who lives in the present can interpret the faith for the present.",
                    "This is the idea of ta'lim — authoritative teaching from the Imam of the Time. Through his guidance (farmans) and the institutions he builds, the Imam helps each generation apply timeless principles to its own world."
                ], reflection: "What question about faith in today's world would I most like guidance on?"),
                Lesson(heading: "One light, many lamps", symbol: "flame.fill", body: [
                    "A familiar image in Ismaili teaching is of lamps lit one from another. The lamps are different, but the flame passed between them is the same.",
                    "In the same way, the Imams have been different individuals across fourteen centuries, while the Noor — the light of Imamat — continues unbroken from Hazrat Ali to Mawlana Hazar Imam today.",
                    "For the seeker, recognising that light is the beginning of the soul's way home."
                ], reflection: "What does it mean to me that this guidance is living and present today?")
            ]
        )
    ]
}
