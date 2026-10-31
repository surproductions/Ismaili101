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
        QAItem(question: "What is the Ismaili view on LGBTQ+ people?",
               category: "Ethics",
               tags: ["gay", "lgbtq+", "lgbt", "sexuality", "queer", "trans"],
               answer: [
                "This app doesn't speak for the Imamat on this question, and Ismailis hold a range of personal views.",
                "Principles that run through the tradition — the dignity of every person, compassion, and a jamat that welcomes and cares for its members — are a starting point many people draw on.",
                "For guidance, speak with a trusted religious education teacher or your local Ismaili institutions."
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
