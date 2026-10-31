import Foundation

// Chapter 15: creation, the universe, purpose, death and the hereafter, and animals.
// Describes classical Ismaili thought in introductory terms; review with educators.

enum BigQuestions {
    static let chapter = Chapter(
        id: 15,
        title: "The Big Questions",
        subtitle: "Creation, purpose, death and the life beyond",
        symbol: "sparkles",
        overview: [
            "Why is there a universe at all? Why are we here? What happens when we die? These are among the oldest human questions, and classical Ismaili thinkers gave them deep thought.",
            "Their answers start from tawhid: God is beyond all description, and everything that exists depends on God's command, 'Be!'. The universe is the unfolding of that command — from the Universal Intellect and Soul down to the stars, the earth, living things and us.",
            "In this picture, the human soul is the point where the whole journey comes together. We are here to know — to recognise our origin, grow through knowledge and goodness, and return. Death is not an end but a passage in that return."
        ],
        keyTerms: [
            KeyTerm(term: "Ibda'", definition: "Origination — God bringing being from not-being, beyond time, through the divine command."),
            KeyTerm(term: "Qiyama", definition: "Resurrection — in Ismaili thought understood above all as the soul's spiritual awakening and return."),
            KeyTerm(term: "Ma'rifa", definition: "Knowledge of God — recognition that is the soul's purpose and fulfilment."),
            KeyTerm(term: "Microcosm", definition: "'Small world' — the idea that a human being contains, in miniature, the whole cosmos.")
        ],
        quiz: [
            QuizQuestion(prompt: "In classical Ismaili thought, how does God create?",
                         options: ["Through the divine command, 'Be!'", "By accident", "From pre-existing gods", "Only through nature"], correctIndex: 0,
                         explanation: "Creation comes through God's command (amr), expressed as 'Be!' (kun)."),
            QuizQuestion(prompt: "Nasir Khusraw described paradise as…",
                         options: ["Consummate knowledge", "Endless feasting", "A city of gold only", "Sleep"], correctIndex: 0,
                         explanation: "He read it symbolically: the soul's fulfilment in knowledge; hell as consummate ignorance."),
            QuizQuestion(prompt: "Why is a human called a 'microcosm'?",
                         options: ["We contain the whole cosmos in miniature", "We are very small", "We live on a small planet", "We are made of atoms"], correctIndex: 0,
                         explanation: "Intellect, soul, and the plant and animal levels all meet in us.")
        ],
        lessons: [
            Lesson(heading: "How did the universe begin?", symbol: "sparkle", body: [
                "Ismaili philosophers used the word ibda' — origination — for God's act of bringing being out of not-being. Through God's command, 'Be!', the Universal Intellect comes into being, perfect and complete.",
                "From the Intellect the Universal Soul emerges, and from the Soul's striving come time, nature and the physical world, unfolding in stages: elements, minerals, plants, animals and finally human beings.",
                "Importantly, ibda' is not described as an event at a moment in time. It is the timeless dependence of everything on God. Modern science describes how the physical universe has developed — from the Big Bang around 13.8 billion years ago to stars, planets and life. Many Ismailis see the two as answering different questions: science explains how the universe unfolds; faith asks why there is anything at all."
            ], reflection: "Which question feels bigger to me: how the universe began, or why there is a universe at all?"),
            Lesson(heading: "What is the universe?", symbol: "globe.europe.africa.fill", body: [
                "In this tradition the universe has layers. Above is the world of origination — Intellect and Soul. Below is the world of nature — matter, time and change. Every physical thing points to a spiritual counterpart, its source or true form.",
                "The Qur'an calls the features of nature ayat — 'signs' — the same word used for its verses. The universe can be read like a book whose meaning points beyond itself.",
                "Human beings are a 'small world', a microcosm. We share growth with plants and sensation with animals, and we carry a trace of the Universal Intellect and a share of the Universal Soul. The whole cosmos is, in a sense, inside us."
            ], reflection: "If nature is a book of signs, what has it 'said' to me lately?"),
            Lesson(heading: "Why are we here?", symbol: "questionmark.circle.fill", body: [
                "The Qur'an says that God created jinn and humankind to worship Him (51:56). Many early commentators understood 'worship' here to include knowing God, and Ismaili thinkers placed knowledge at the heart of the soul's purpose.",
                "A well-known saying, cherished especially in mystical traditions, has God say: 'I was a hidden treasure and I loved to be known, so I created the world.' Though it is not found in the standard hadith collections, it captures a theme many Muslims share: creation exists so that God may be known.",
                "In Ismaili thought, humanity is where the purpose of creation comes together. Through human souls — guided by the Prophet and the Imams — the longing of the Universal Soul for perfection is fulfilled. Our lives matter because our souls can grow, know, love and return."
            ], reflection: "What would it mean for me to live as if knowing God were my purpose?"),
            Lesson(heading: "What happens when we die?", symbol: "moon.stars.fill", body: [
                "The body returns to the earth, but the soul continues. In Ismaili thought, this world is a stop on the soul's journey, and death is a passage, not an end.",
                "What the soul carries with it are its 'provisions' — the knowledge it has gained and the good it has done. Nasir Khusraw stressed that these, not wealth or status, shape the soul's state beyond this life.",
                "This is why the tradition emphasises living with purpose now: learning, serving, remembering God and growing in character."
            ], reflection: "What 'provisions' would I want my soul to carry?"),
            Lesson(heading: "The Day of Judgement", symbol: "scalemass.fill", body: [
                "The Qur'an speaks of a Day of Resurrection and Judgement, when every soul will see what it has done. All Muslims, including Ismailis, affirm it.",
                "Ismaili thinkers emphasised its inner meaning. Qiyama — resurrection — is above all the soul's awakening to its true nature. Nasir Khusraw read paradise as consummate knowledge and hell as consummate ignorance: the soul's own state, revealed.",
                "Judgement is perfectly just ('adl). Each soul is measured according to its own capacity and circumstances, by a God whose mercy is also limitless."
            ], reflection: "If paradise is knowledge, where in my life do I already taste a little of it?"),
            Lesson(heading: "Animals and our care for them", symbol: "pawprint.fill", body: [
                "In classical Ismaili thought, animals have a sensing soul: they feel, perceive and suffer. Humans, with a rational soul, carry responsibility for how they treat other creatures.",
                "Muslim tradition is full of teaching on kindness to animals. The Prophet told of a man forgiven for giving water to a thirsty dog, and of a woman punished for starving a cat. Cruelty to animals is a moral wrong.",
                "There is no single Ismaili ruling on keeping pets; families make their own choices. What the tradition asks is clear: care for any animal in your keeping with compassion — food, shelter, health and gentleness. Whether animals have a life beyond this one is not something the tradition answers definitively; it trusts God's justice and mercy for all creation."
            ], reflection: "How can I show more compassion to the animals around me?")
        ]
    )
}
