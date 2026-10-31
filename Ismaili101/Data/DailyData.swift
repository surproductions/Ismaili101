import Foundation

// The 28-day Daily Path: one short reading a day, four weekly themes.
// Introductory wording — review with community educators before release.

enum DailyData {
    static let weekTitles = [
        1: "Foundations",
        2: "Our History",
        3: "Thought & Philosophy",
        4: "Faith in Daily Life"
    ]

    static let all: [DailyReading] = [
        // MARK: Week 1 — Foundations
        DailyReading(day: 1, title: "What is Islam?", symbol: "moon.stars.fill", paragraphs: [
            "Islam means 'submission' or 'surrender' to God. Muslims believe in one God (Allah), and that Muhammad is God's final Prophet, who received the Qur'an through revelation in 7th-century Arabia.",
            "The declaration of faith, the shahada, affirms both: there is no god but God, and Muhammad is the Messenger of God.",
            "Today, nearly two billion people around the world are Muslim, across many cultures, languages and traditions of interpretation."
        ], reflection: "What does 'surrender to God' mean to me in practice?"),
        DailyReading(day: 2, title: "Shia and Sunni", symbol: "arrow.triangle.branch", paragraphs: [
            "After the Prophet died in 632, Muslims disagreed about who should lead the community. Those who followed the elected caliphs became known as Sunni Muslims.",
            "Others held that the Prophet had designated Hazrat Ali, his cousin and son-in-law. They became known as the Shi'at Ali — the 'party of Ali' — or Shia.",
            "Sunni and Shia Muslims share the Qur'an, the Prophet, and the core of the faith. Their main difference is about authority and interpretation after the Prophet."
        ], reflection: "Why might a living guide matter after a prophet has passed away?"),
        DailyReading(day: 3, title: "Who are the Ismailis?", symbol: "person.3.fill", paragraphs: [
            "The Shia Imami Ismaili Muslims are a Shia community who follow a living, hereditary Imam descended from the Prophet through Hazrat Ali and Bibi Fatima.",
            "The name comes from Imam Isma'il, son of Imam Ja'far al-Sadiq. The Ismailis today are the Nizari branch, named after Imam Nizar.",
            "Ismailis live in more than 25 countries and are known for their emphasis on intellect, pluralism, service and a living tradition of guidance."
        ], reflection: "Which part of my community's identity am I most curious to learn about?"),
        DailyReading(day: 4, title: "Hazrat Ali", symbol: "shield.fill", paragraphs: [
            "Ali ibn Abi Talib was raised in the Prophet's household and was among the very first to accept Islam. He married the Prophet's daughter, Bibi Fatima.",
            "He was known for courage, justice and wisdom. His sermons and letters, collected in the Nahj al-Balagha, speak of reason, fairness to the poor, and the responsibilities of leaders.",
            "For Ismailis, Ali is the first Imam, and the light of Imamat passes from him to every Imam who follows."
        ], reflection: "Which quality of Hazrat Ali — courage, justice or wisdom — do I most want to grow in?"),
        DailyReading(day: 5, title: "Bibi Fatima", symbol: "heart.fill", paragraphs: [
            "Fatima was the daughter of the Prophet Muhammad and Khadija. She is honoured across the Muslim world for her devotion, strength and closeness to her father.",
            "Through her marriage to Hazrat Ali, the line of the Imams descends from the Prophet. The Fatimid dynasty took its name from her.",
            "She is a model of faith lived with dignity in difficult times."
        ], reflection: "Who in my own family has shown quiet strength in hard times?"),
        DailyReading(day: 6, title: "Imam Husayn and Karbala", symbol: "flame.fill", paragraphs: [
            "Imam Husayn, son of Ali and Fatima, refused to pledge allegiance to a ruler he considered unjust. In 680 CE, at Karbala in Iraq, he and a small group of family and companions were killed.",
            "Muslims around the world remember Karbala on Ashura. For many, it stands for the courage to stand for justice, whatever the cost.",
            "Ismailis count Imam Husayn as the second Imam in the line of Imamat."
        ], reflection: "What is one thing I would stand up for, even if it was hard?"),
        DailyReading(day: 7, title: "Week 1 review", symbol: "checkmark.seal.fill", paragraphs: [
            "This week you met the foundations: Islam and the shahada, the Shia–Sunni difference about leadership, the Ismailis, and the first family of the Imamat — Hazrat Ali, Bibi Fatima and Imam Husayn.",
            "Try the knowledge checks in Chapter 5 (Imamat) to test what you remember, or play a round of True or False in the Play tab."
        ], reflection: "What surprised me most this week?"),

        // MARK: Week 2 — Our History
        DailyReading(day: 8, title: "A succession and a name", symbol: "signpost.right.fill", paragraphs: [
            "When Imam Ja'far al-Sadiq died in 765, his followers divided. Those who followed his son Isma'il and Isma'il's descendants became the Ismailis.",
            "Others followed a different son, Musa al-Kazim; their line became the Twelver Shia, the largest Shia community today, found especially in Iran and Iraq.",
            "Both groups share a love of the Prophet's family; they differ on the line of Imams."
        ], reflection: "How can communities that disagree still respect what they share?"),
        DailyReading(day: 9, title: "Years in concealment", symbol: "eye.slash.fill", paragraphs: [
            "For about a century and a half after Imam Isma'il, the Imams lived in hiding to protect themselves from persecution. For much of this time they lived in Salamiyya, in Syria.",
            "Their teachers, the da'is, spread the message quietly across the Muslim world — to Yemen, North Africa, Iraq and Persia.",
            "This period is called satr, concealment. It shows how the Imamat continued even when it could not be seen."
        ], reflection: "Where in my life does important work happen quietly, out of sight?"),
        DailyReading(day: 10, title: "The rise of the Fatimids", symbol: "crown.fill", paragraphs: [
            "In 909, Imam al-Mahdi emerged in North Africa and founded the Fatimid Caliphate, named after Bibi Fatima.",
            "For the first time in generations, the Ismaili Imam ruled openly as head of a state. Under later Imams it grew to include Egypt, the Hijaz with Mecca and Madina, and parts of Syria.",
            "The Fatimid era is remembered as a golden age of art, science and learning."
        ], reflection: "What does it take to build something that lasts for centuries?"),
        DailyReading(day: 11, title: "Life in Fatimid Cairo", symbol: "building.columns.fill", paragraphs: [
            "Cairo, founded in 969, became one of the great cities of the world. Al-Azhar became a centre of learning, and the Dar al-'Ilm opened its library to the public in 1005.",
            "Trade flowed through Egypt from the Mediterranean to India. Christians and Jews served alongside Muslims in the government.",
            "Visitors like Nasir Khusraw described a prosperous, orderly city full of markets, gardens and scholars."
        ], reflection: "If I could visit Fatimid Cairo for a day, what would I want to see?"),
        DailyReading(day: 12, title: "Nizar and a turning point", symbol: "arrow.left.arrow.right", paragraphs: [
            "When Imam al-Mustansir died in 1094, the succession was disputed. His eldest son Nizar was pushed aside by a powerful vizier who installed a younger brother.",
            "Nizar's followers, especially in Persia and Syria, remained loyal to his line. They became the Nizari Ismailis — the community led today by the Aga Khan.",
            "The Imamat continued through Nizar's descendants, even as the Fatimid state in Egypt went its own way."
        ], reflection: "What helps people stay loyal to what they believe is right?"),
        DailyReading(day: 13, title: "Alamut, the eagle's nest", symbol: "mountain.2.fill", paragraphs: [
            "In 1090 the da'i Hasan-i Sabbah took the mountain fortress of Alamut in northern Persia. It became the centre of a Nizari state of fortresses and towns across Persia and Syria.",
            "Alamut was famous for its library. Scholars such as Nasir al-Din al-Tusi worked among the Nizaris.",
            "In 1256 the Mongols captured Alamut. The state ended, but the Imamat did not."
        ], reflection: "What survives when buildings and states are lost?"),
        DailyReading(day: 14, title: "Anjudan to the modern age", symbol: "sunrise.fill", paragraphs: [
            "After Alamut, the Imams again lived quietly, sometimes as Sufi masters. In the 15th century they settled in Anjudan in central Persia, starting a revival of teaching.",
            "In the 1840s, Aga Khan I moved to India. His successors, Aga Khan III and Aga Khan IV, led the community into the modern world with schools, hospitals and global institutions.",
            "Today, under Aga Khan V, the community is spread across the globe."
        ], reflection: "Which period of this history would I like to read more about?"),

        // MARK: Week 3 — Thought & Philosophy
        DailyReading(day: 15, title: "The gift of 'aql", symbol: "brain.head.profile", paragraphs: [
            "'Aql means intellect. In Ismaili thought it is one of God's greatest gifts — the faculty that recognises truth and tells right from wrong.",
            "Faith, in this tradition, is not asked to switch off thinking. Questions are welcome as part of the search.",
            "The more we use the intellect with sincerity, the more it grows."
        ], reflection: "What question about faith have I been afraid to ask?"),
        DailyReading(day: 16, title: "Outer and inner", symbol: "eye.circle.fill", paragraphs: [
            "Everything has a zahir, an outward form, and a batin, an inner meaning. A prayer has words and actions; it also has an intention and a spirit.",
            "Ismaili tradition values both. The outer form is the way in; the inner meaning is the destination.",
            "Today, try noticing the inner meaning of something ordinary — a greeting, a meal, a sunrise."
        ], reflection: "What ordinary habit of mine has a deeper meaning?"),
        DailyReading(day: 17, title: "Ta'wil in practice", symbol: "key.fill", paragraphs: [
            "Ta'wil is leading the outward form back to its origin, its inner truth.",
            "In the classical tradition, ablution was read as more than washing: it is cleansing the soul with knowledge. Facing the Kaaba can be read as the heart turning to its spiritual centre.",
            "Ta'wil is connected to the guidance of the Imam of the Time, not personal guesswork."
        ], reflection: "If washing can mean learning, what might 'learning' clean in me?"),
        DailyReading(day: 18, title: "Intellect, Soul and the cosmos", symbol: "sparkles", paragraphs: [
            "Classical Ismaili thinkers pictured creation like this: God commands 'Be!', and the Universal Intellect comes forth, perfect and complete.",
            "From the Intellect comes the Universal Soul, perfect in potential and longing to be closer to its source. Its longing sets the cosmos in motion.",
            "Our own intellect and soul are small mirrors of these. The cosmos is, in a sense, inside us too."
        ], reflection: "Where do I feel the 'longing' this picture describes?"),
        DailyReading(day: 19, title: "A traveller named Nasir", symbol: "figure.hiking", paragraphs: [
            "At about forty, Nasir Khusraw left his comfortable job to search for truth. His seven-year journey took him to Fatimid Cairo, where he found the Imam of the Time.",
            "He returned home as a teacher, faced persecution, and spent his last years in the mountains of Badakhshan, writing philosophy and poetry.",
            "Ismailis of Central Asia honour him as Pir. Read Chapter 11 to learn more."
        ], reflection: "Is it ever too late to start searching?"),
        DailyReading(day: 20, title: "The soul as traveller", symbol: "bag.fill", paragraphs: [
            "Nasir Khusraw called one of his books 'Provisions for Travellers'. The soul is the traveller; this world is a stop on the road.",
            "The soul comes from a perfect source, but here it is still becoming — like a seed that already holds the tree. Knowledge and good deeds are its provisions.",
            "Read Chapter 13 for the full journey."
        ], reflection: "What provision did I gather today?"),
        DailyReading(day: 21, title: "Week 3 review: tawhid", symbol: "infinity", paragraphs: [
            "All of this thought rests on tawhid, the oneness of God. Ismaili philosophers taught that God is beyond every description we can make.",
            "We draw close to God not by picturing God, but through the intellect, through guidance, through remembrance and through love.",
            "Try the Match Up game in the Play tab to review this week's terms."
        ], reflection: "How has my picture of God changed this week?"),

        // MARK: Week 4 — Faith in Daily Life
        DailyReading(day: 22, title: "The jamatkhana", symbol: "house.fill", paragraphs: [
            "The jamatkhana — 'house of the community' — is where Ismailis gather for prayer, ceremonies and community life.",
            "It is a place to pray, to meet friends, to learn and to serve. Many jamatkhanas also host educational and social programmes.",
            "Its spirit is one of humility, cleanliness and respect for others."
        ], reflection: "What does my jamatkhana — or my community space — mean to me?"),
        DailyReading(day: 23, title: "Du'a and bandagi", symbol: "moon.stars.fill", paragraphs: [
            "The Du'a is recited in the jamatkhana, traditionally at morning, evening and night. It connects each person to the community and to God.",
            "Many also practise bandagi, silent meditation in the early hours before dawn, when the world is still.",
            "Communal prayer and personal reflection support each other."
        ], reflection: "When during my day is it easiest to be still?"),
        DailyReading(day: 24, title: "Ginans and qasidas", symbol: "music.note", paragraphs: [
            "Ginans are devotional hymns composed by the pirs in South Asia. Qasidas, especially those linked to Nasir Khusraw, are sung in Central Asia.",
            "They carry teachings about the soul, ethics and love of God in poetry that is easy to remember.",
            "Music and poetry move the heart as well as the mind — another way of remembering God."
        ], reflection: "Which verse or melody stays with me, and why?"),
        DailyReading(day: 25, title: "The spirit of khidmat", symbol: "hand.raised.fill", paragraphs: [
            "Khidmat means voluntary service. Volunteers run much of jamati life, from religious education to events to emergency response.",
            "Service is understood as an offering — a way of thanking God by helping others.",
            "Any skill can become khidmat: teaching, cooking, organising, listening."
        ], reflection: "What is one small act of service I can offer this week?"),
        DailyReading(day: 26, title: "AKDN: faith in action", symbol: "globe.americas.fill", paragraphs: [
            "The Aga Khan Development Network works in over 30 countries on health, education, culture, rural development and economic opportunity.",
            "It serves people of every faith and background. Its work reflects the ethic that improving quality of life is part of faith.",
            "Explore the Impact tab to learn about each agency."
        ], reflection: "Which kind of AKDN work inspires me most?"),
        DailyReading(day: 27, title: "Pluralism in a diverse world", symbol: "person.3.fill", paragraphs: [
            "Pluralism means valuing human diversity, not just tolerating it.",
            "From Fatimid Cairo, where people of many faiths served in government, to today's Global Centre for Pluralism in Ottawa, this value runs deep.",
            "Living it means curiosity about others, respect in disagreement and working together for the common good."
        ], reflection: "Who could I learn something from this week, from a different background to mine?"),
        DailyReading(day: 28, title: "Your continuing journey", symbol: "star.fill", paragraphs: [
            "You've completed the Daily Path — four weeks of foundations, history, philosophy and practice.",
            "The journey doesn't end here. Keep mastering the chapter questions, revisit the lessons, and explore the Q&A.",
            "Above all, keep asking questions. As Nasir Khusraw taught, the intellect grows through use — and the soul through knowledge, remembrance and service."
        ], reflection: "What do I want to keep learning next?")
    ]
}
