import Foundation

// Introductory answers. They describe the tradition in general terms and do not
// speak for the Imamat. Have them reviewed by community educators before release.

enum QAData {
    static let all: [QAItem] = [
        QAItem(question: "Who is the present Imam?",
               category: "Imamat",
               tags: ["hazar imam", "aga khan v", "rahim", "50th"],
               answer: [
                "His Highness Prince Rahim Aga Khan V is the 50th hereditary Imam of the Shia Ismaili Muslims.",
                "He succeeded his father, Aga Khan IV, on 4 February 2025, as designated in his father's will — the practice of nass."
               ]),
        QAItem(question: "Where does the title 'Aga Khan' come from?",
               category: "History",
               tags: ["aga khan title", "persia", "qajar", "1818"],
               answer: [
                "The honorific 'Aga Khan' was granted to the 46th Imam, Hasan Ali Shah, by Fath Ali Shah Qajar of Persia around 1818.",
                "It has been inherited by each Imam since. It is a title of honour; the religious office itself is the Imamat."
               ]),
        QAItem(question: "Do Ismailis accept evolution?",
               category: "Faith & Science",
               tags: ["evolution", "science", "creation", "darwin"],
               answer: [
                "The Ismaili tradition treats intellect and scientific inquiry as ways of understanding God's creation, and the Imams have described faith and reason as complementary.",
                "Because ta'wil allows creation narratives to be read symbolically, many Ismailis see no conflict between faith and evolutionary science.",
                "Individual views vary; this is a matter of understanding rather than a required doctrine."
               ]),
        QAItem(question: "How does the faith view autism and neurodivergence?",
               category: "Ethics",
               tags: ["autism", "neurodivergence", "adhd", "disability", "inclusion"],
               answer: [
                "Human dignity belongs to every person. Divine justice ('adl) means each soul is understood in light of its own capacities and circumstances.",
                "Being neurodivergent does not lessen anyone's worth or place in the community. Jamati institutions increasingly work on accessibility and inclusion in jamatkhanas and programmes.",
                "For support, families can contact their local Ismaili Council or religious education board."
               ]),
        QAItem(question: "Who was Pir Nasir Khusraw?",
               category: "Philosophy",
               tags: ["nasir khusraw", "nasir khusrau", "pir", "badakhshan", "poet", "philosopher"],
               answer: [
                "Nasir Khusraw (born 1004) was a Persian poet, philosopher and traveller. After a seven-year journey that included about three years in Fatimid Cairo, he became the chief Ismaili teacher (hujjat) of Khurasan.",
                "Exiled for his beliefs, he spent his last years in Badakhshan, where Ismailis honour him as Pir. His works explore God's oneness, the intellect, and the soul's journey back to its source.",
                "See chapters 11–13 in Learn for more."
               ]),
        QAItem(question: "Is the soul perfect?",
               category: "Philosophy",
               tags: ["soul", "nafs", "perfect", "perfection", "origin", "return"],
               answer: [
                "In Nasir Khusraw's thought, the soul comes from a perfect, spiritual source and carries the potential for perfection — like a seed that already holds the tree.",
                "In this world it is still becoming. Through knowledge, guidance and good action, it grows from potential toward actual perfection and draws closer to its origin. The longing we feel for something beyond this world can be read as the soul remembering where it came from."
               ]),
        QAItem(question: "How does the Imam guide the soul?",
               category: "Imamat",
               tags: ["imam", "intellect", "soul", "ta'yid", "tayid", "noor", "guidance", "light"],
               answer: [
                "Classical Ismaili thinkers taught that the Imam receives ta'yid — divine support — so that his intellect and soul are perfected. He is the living guide and the bridge between the spiritual and physical worlds.",
                "Through his teaching (ta'lim), the Imam helps each seeker turn the soul's potential into reality. The light of guidance (Noor) continues from Imam to Imam, like one flame passed between lamps."
               ]),
        QAItem(question: "How can we know a God beyond description?",
               category: "Philosophy",
               tags: ["god", "allah", "tawhid", "oneness", "relationship", "love"],
               answer: [
                "Ismaili thought holds that God is beyond every human category, so we cannot picture God. Instead we relate to God through God's Word, through the intellect it brings forth, through the guidance of the Imam, and through remembrance and love.",
                "Prayer, learning and service are all ways the soul turns toward its source."
               ]),
        QAItem(question: "How was the universe created?",
               category: "Big Questions",
               tags: ["creation", "universe", "big bang", "origin", "ibda", "cosmos"],
               answer: [
                "Classical Ismaili thinkers taught that God originates all being through the divine command, 'Be!' — a timeless act called ibda'. First comes the Universal Intellect, then the Universal Soul, whose striving gives rise to time, nature and the physical world in stages.",
                "Science describes how the physical universe developed after the Big Bang about 13.8 billion years ago. Many Ismailis see no conflict: science explains how the universe unfolds; faith asks why anything exists at all.",
                "See Chapter 15, 'The Big Questions'."
               ]),
        QAItem(question: "What is the universe?",
               category: "Big Questions",
               tags: ["universe", "cosmos", "reality", "microcosm", "signs"],
               answer: [
                "In Ismaili thought the universe has layers: a spiritual world of Intellect and Soul, and a physical world of matter and time. Every physical thing points to a spiritual counterpart.",
                "The Qur'an calls nature's features 'signs'. And each human being is a microcosm — a small world containing the whole cosmos in miniature."
               ]),
        QAItem(question: "What is the point of this life and reality?",
               category: "Big Questions",
               tags: ["purpose", "meaning", "why", "reality", "point", "life"],
               answer: [
                "The Qur'an says God created humankind to worship Him (51:56), and many commentators understood this to include knowing God. Ismaili thinkers placed knowledge at the heart of the soul's purpose.",
                "In this view, our souls come from a perfect source and are here to grow — through knowledge, goodness, remembrance and the Imam's guidance — and to return. Human life is where the purpose of creation comes together."
               ]),
        QAItem(question: "What happens when we die?",
               category: "Big Questions",
               tags: ["death", "die", "pass away", "afterlife", "soul", "hereafter"],
               answer: [
                "The body returns to the earth, but the soul continues its journey. Death is understood as a passage, not an end.",
                "The soul carries with it what it has gained: knowledge and good deeds. That is why the tradition emphasises living with purpose now."
               ]),
        QAItem(question: "What is the Day of Judgement?",
               category: "Big Questions",
               tags: ["judgement", "judgment", "qiyama", "resurrection", "heaven", "hell", "paradise"],
               answer: [
                "The Qur'an speaks of a Day of Resurrection when every soul sees what it has done, and Ismailis affirm it. Ismaili thinkers emphasised its inner meaning: qiyama as the soul's awakening to its true nature.",
                "Nasir Khusraw described paradise as consummate knowledge and hell as consummate ignorance. Judgement is perfectly just and measured by each soul's capacity, and God's mercy is limitless."
               ]),
        QAItem(question: "What is the view on pets and animals?",
               category: "Big Questions",
               tags: ["pets", "pet", "animals", "dog", "cat", "animal welfare"],
               answer: [
                "Animals, in classical Ismaili thought, have a sensing soul — they feel and suffer — and humans are responsible for treating them well. Muslim tradition praises kindness to animals and condemns cruelty: the Prophet told of a man forgiven for watering a thirsty dog.",
                "There is no single Ismaili ruling on keeping pets; families choose for themselves. If you keep an animal, care for it with compassion. For specific questions, ask your local religious education teachers."
               ]),
        QAItem(question: "Did the Qur'an predict modern science?",
               category: "Faith & Science",
               tags: ["science", "miracles", "quran", "big bang", "atheist", "proof", "embryology"],
               answer: [
                "Some people point to verses that seem to match later discoveries, such as an expanding universe or stages of the embryo. Supporters find these meaningful; critics note the verses can be read in several ways and that such readings usually appear after a discovery. They are not scientific proof.",
                "What is well documented is that scientists in Muslim societies made major discoveries centuries before Europe — in algebra, optics, medicine and astronomy. The Ismaili tradition sees faith and science as complementary, and reads scripture for its inner meaning rather than as a science textbook.",
                "See 'Faith & Science' on the Learn tab."
               ]),
        QAItem(question: "What did Muslim scientists discover?",
               category: "Faith & Science",
               tags: ["inventions", "discoveries", "algebra", "optics", "medicine", "golden age", "muslim scientists"],
               answer: [
                "Highlights include al-Khwarizmi's algebra (c. 820), Ibn al-Haytham's optics in Fatimid Cairo (c. 1011–1021), Ibn Sina's Canon of Medicine, Ibn al-Nafis's description of blood flow through the lungs (1242), and al-Tusi's astronomy, later echoed by Copernicus.",
                "Several are linked to Ismaili history, such as the Fatimid astronomer Ibn Yunus and al-Tusi's years among the Nizaris."
               ]),
        QAItem(question: "What is the Du'a and when is it recited?",
               category: "Practice",
               tags: ["prayer", "dua", "du'a", "namaz", "salah"],
               answer: [
                "The Du'a is the prayer Ismailis recite in the jamatkhana, traditionally at the morning, evening and night times.",
                "It is complemented by personal prayer, dhikr (remembrance) and meditation."
               ]),
        QAItem(question: "What is a jamatkhana?",
               category: "Practice",
               tags: ["jamatkhana", "mosque", "community", "jamat"],
               answer: [
                "'Jamatkhana' means 'house of the community'. It is where Ismailis gather for prayer, ceremonies and community life.",
                "Many jamatkhanas also host educational and social programmes."
               ]),
        QAItem(question: "What's the difference between zahir and batin?",
               category: "Philosophy",
               tags: ["zahir", "batin", "esoteric", "exoteric"],
               answer: [
                "Zahir is the outward form — the words of a text or the actions of a ritual. Batin is the inner meaning those forms point to.",
                "Ismaili tradition values both: the outer form is the way in, the inner meaning is the destination."
               ]),
        QAItem(question: "What is ta'wil?",
               category: "Philosophy",
               tags: ["tawil", "ta'wil", "interpretation", "symbolism"],
               answer: [
                "Ta'wil is esoteric interpretation: leading an outward form back to its original, inner meaning.",
                "Classical works such as Nasir Khusraw's Wajh-i Din apply ta'wil to practices like ablution and prayer."
               ]),
        QAItem(question: "Who are the Ismailis?",
               category: "Basics",
               tags: ["ismaili", "shia", "nizari", "who"],
               answer: [
                "The Shia Imami Ismaili Muslims (the Nizari Ismailis) are a Shia Muslim community who follow a living, hereditary Imam descended from the Prophet through Hazrat Ali and Bibi Fatima.",
                "They live in more than 25 countries and are known for an emphasis on intellect, pluralism and service."
               ],
               furtherReading: "The Institute of Ismaili Studies — iis.ac.uk"),
        QAItem(question: "What is AKDN?",
               category: "Institutions",
               tags: ["akdn", "development", "aga khan foundation", "charity"],
               answer: [
                "The Aga Khan Development Network is a group of agencies working in over 30 countries on health, education, culture, rural development and economic opportunity.",
                "Its programmes serve people regardless of faith, origin or gender."
               ],
               furtherReading: "the.akdn")
    ]
}
