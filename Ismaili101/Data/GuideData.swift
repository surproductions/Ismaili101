import Foundation

// Guides: festivals & calendar, everyday ethics, and community institutions.
// Introductory wording — review with community educators before release.

enum GuideData {
    static let all: [GuidePage] = [festivals, ethics, institutions]

    // MARK: Festivals & calendar

    static let festivals = GuidePage(
        title: "Festivals & Calendar",
        subtitle: "The days Ismailis celebrate, and why",
        symbol: "calendar",
        intro: "Ismailis celebrate festivals shared by all Muslims, festivals shared by Shia Muslims, and days special to the Ismaili community. Most Islamic dates follow the lunar calendar, so they move about 11 days earlier each year on the everyday calendar.",
        sections: [
            GuideSection(heading: "The Islamic calendar", symbol: "moon.fill",
                         body: ["The Hijri calendar is lunar: each month begins with the new moon, and a year is about 354 days. Year 1 begins with the Prophet's migration (Hijra) to Madina in 622 CE.",
                                "Because it is shorter than the solar year, festivals like Ramadan and the Eids move through the seasons over a cycle of about 33 years."]),
            GuideSection(heading: "Navroz", symbol: "leaf.fill", detail: "Around 21 March",
                         body: ["Navroz ('new day') marks the spring equinox and the Persian new year. It is celebrated widely by Ismailis — especially in Central Asia, Iran, Afghanistan and Pakistan — as a festival of renewal, gratitude and new beginnings.",
                                "Families gather, share special foods and attend jamatkhana."]),
            GuideSection(heading: "Imamat Day", symbol: "crown.fill", detail: "4 February",
                         body: ["The anniversary of the day the present Imam, Prince Rahim Aga Khan V, succeeded to the Imamat in 2025. Ismailis renew their allegiance to the Imam and give thanks for his guidance.",
                                "Under Aga Khan IV, Imamat Day was celebrated on 11 July, the anniversary of his accession in 1957."]),
            GuideSection(heading: "Salgirah", symbol: "gift.fill", detail: "12 October",
                         body: ["Salgirah Khushiali celebrates the birthday of the present Imam. The name combines Persian words for 'anniversary' and 'happiness'.",
                                "Under Aga Khan IV, Salgirah was on 13 December."]),
            GuideSection(heading: "Ramadan and Laylat al-Qadr", symbol: "moon.stars.fill", detail: "9th month",
                         body: ["Ramadan is the month in which the Qur'an's revelation began. Laylat al-Qadr, the 'Night of Power', commemorates the first revelation and falls in the last part of the month.",
                                "Ismaili practice places great emphasis on the inner meaning of fasting — restraint from wrongdoing all year. Practices around outward fasting vary; see the Everyday Ethics guide."]),
            GuideSection(heading: "Eid al-Fitr", symbol: "sparkles", detail: "1 Shawwal",
                         body: ["The festival that ends Ramadan, celebrated by Muslims worldwide with prayers, gifts, charity and time with family."]),
            GuideSection(heading: "Eid al-Adha", symbol: "heart.fill", detail: "10 Dhu al-Hijja",
                         body: ["The 'festival of sacrifice' remembers Abraham's willingness to give up what he loved for God, and coincides with the pilgrimage (Hajj) season. It is a time of prayer, generosity and sharing with those in need."]),
            GuideSection(heading: "Eid-e-Ghadir", symbol: "hand.raised.fill", detail: "18 Dhu al-Hijja",
                         body: ["Commemorates Ghadir Khumm in 632, when the Prophet raised Hazrat Ali's hand and declared, 'Of whomsoever I am mawla, Ali is his mawla.' It is especially important to Shia Muslims, as it marks the beginning of the Imamat."]),
            GuideSection(heading: "Milad un-Nabi", symbol: "star.fill", detail: "Rabi' al-Awwal",
                         body: ["Celebrates the birth of the Prophet Muhammad. Different Muslim communities mark it on different days of the month."]),
            GuideSection(heading: "Lailat al-Mi'raj", symbol: "arrow.up.circle.fill", detail: "27 Rajab (commonly)",
                         body: ["Remembers the Night Journey and Ascension (al-Isra' wa'l-Mi'raj), when tradition tells that the Prophet travelled from Mecca to Jerusalem and through the heavens."]),
            GuideSection(heading: "Ashura", symbol: "flame.fill", detail: "10 Muharram",
                         body: ["Shia Muslims remember the martyrdom of Imam Husayn and his companions at Karbala in 680 — a day of reflection on standing for justice."])
        ],
        note: "Dates on the lunar calendar depend on the sighting or calculation of the new moon, and local jamats announce exact dates each year.",
        sources: [Src.wikiImamatDay, Src.bcImamatDay, Src.wikiSalgirah, Src.iisFestivals])

    // MARK: Everyday ethics

    static let ethics = GuidePage(
        title: "Living Your Faith",
        subtitle: "Everyday ethics young Ismailis ask about",
        symbol: "figure.walk",
        intro: "Ismailis look to the guidance of the Imam of the Time on how to live ethically today. These summaries are introductory; for personal questions, speak with your local religious education teachers (ITREB) or Council.",
        sections: [
            GuideSection(heading: "Halal and haram", symbol: "checkmark.shield.fill",
                         body: ["Halal means permitted and haram means forbidden. For Ismailis, the Imam of the Time is the authoritative guide on what these mean today, just as the Prophet guided the first Muslims.",
                                "Commentators on the Imams' guidance list alcohol, drugs, smoking and pork as things to avoid — and also lying, cheating and backbiting. A halal life is about character as much as food."]),
            GuideSection(heading: "Alcohol, smoking and drugs", symbol: "nosign",
                         body: ["The Ismaili Imams have consistently urged their followers to stay away from alcohol, smoking and drugs. Aga Khan III called alcohol 'the greatest of all sins', and Aga Khan IV described drinking, smoking and drug use as social evils.",
                                "The reason given is that they harm the body and cloud the intellect — the faculty Ismaili thought treasures most. The Imams condemned the acts, not the people: support and forgiveness remain open to anyone who is struggling."]),
            GuideSection(heading: "Fasting", symbol: "moon.fill",
                         body: ["Ismaili teaching emphasises 'inner' fasting: restraint from falsehood, deceit, backbiting and wrongdoing all year round.",
                                "Practices around outward fasting during Ramadan have varied in Ismaili history and vary among Ismailis today. Ask your local ITREB about current guidance and practice in your jamat."]),
            GuideSection(heading: "Money and work", symbol: "banknote.fill",
                         body: ["Earning an honest living is part of faith — the Prophet himself was a merchant known for honesty. Avoid cheating, exploitation and debts you cannot repay.",
                                "The Qur'an forbids gambling (5:90). Generosity and sharing with those in need are central Muslim values."]),
            GuideSection(heading: "Marriage and relationships", symbol: "heart.circle.fill",
                         body: ["Marriage in Islam (nikah) is a sacred partnership built on mutual respect, kindness and consent. Ismaili marriages are solemnised in a religious ceremony.",
                                "Questions about specific situations — including marrying someone of another faith — are best discussed with your family and your local Ismaili Council or ITREB, who can explain current guidance."]),
            GuideSection(heading: "Mental health", symbol: "brain.head.profile",
                         body: ["Caring for your mind is as important as caring for your body. Feeling anxious, low or overwhelmed is common, and seeking help from a doctor, counsellor or trusted adult is a sign of strength, not weakness.",
                                "AKDN agencies such as Aga Khan University work on mental health care, and many jamati institutions offer support programmes. If you are struggling, talk to someone you trust."]),
            GuideSection(heading: "Life online", symbol: "iphone",
                         body: ["The ethics of speech apply online too: avoid backbiting, mockery and spreading things you haven't checked. Treat people with the same dignity you would face to face.",
                                "Use technology to learn and connect — and know when to put it down for rest, family and reflection."]),
            GuideSection(heading: "Caring for the earth", symbol: "leaf.circle.fill",
                         body: ["The earth is a trust (amana) from God. Wasting resources and harming the environment go against that trust.",
                                "Aga Khan V chaired AKDN's Environment and Climate Committee before his Imamat, and climate action is part of AKDN's work."])
        ],
        note: "Some summaries draw on Ismaili Gnosis, an independent site that compiles the Imams' guidance; it is not an official institution.",
        sources: [Src.gnosisHalal, Src.gnosisAlcohol, Src.gnosisFasting, Src.quran("5:90", "5/90"), Src.wikiAgaKhanV])

    // MARK: Community institutions

    static let institutions = GuidePage(
        title: "Community & Institutions",
        subtitle: "How jamati life is organised",
        symbol: "building.2.fill",
        intro: "Alongside AKDN's development agencies, the Ismaili community has its own institutions, set out in the Constitution of the Shia Imami Ismaili Muslims. They organise community life, religious education and the peaceful resolution of disputes.",
        sections: [
            GuideSection(heading: "The Ismaili Constitution", symbol: "doc.text.fill", detail: "1986, renewed 1998",
                         body: ["Aga Khan IV signed a Constitution for the worldwide community on 13 December 1986 in Geneva, after decades of consultation that began in 1964. A new Constitution was promulgated on 11 July 1998.",
                                "It sets out the Imam's authority, the community's institutions, and the rights and duties of members."]),
            GuideSection(heading: "Councils", symbol: "person.3.fill",
                         body: ["National Councils, with regional and local councils beneath them, organise social and community life in each country — from health and education programmes to youth, seniors and economic support.",
                                "Council members serve as volunteers, appointed by the Imam."]),
            GuideSection(heading: "Religious education boards (ITREB)", symbol: "book.fill",
                         body: ["The Ismaili Tariqah and Religious Education Boards organise religious education for children and adults, train teachers, and publish materials.",
                                "They are the place to go with questions about faith and practice."]),
            GuideSection(heading: "Conciliation and Arbitration Boards", symbol: "scalemass.fill",
                         body: ["CABs help community members resolve disputes — family, business or other — through mediation and arbitration, peacefully and confidentially, without going to court.",
                                "There are national boards and an International Board for cross-border disputes."]),
            GuideSection(heading: "Grants and Review Boards", symbol: "checklist",
                         body: ["These boards oversee the proper use of community funds and grants."]),
            GuideSection(heading: "The Leaders' International Forum", symbol: "globe",
                         body: ["A body of senior community leaders that advises the Imam on matters affecting the worldwide jamat."]),
            GuideSection(heading: "Mukhi and Kamadia", symbol: "house.fill",
                         body: ["Each jamatkhana has a Mukhi and Kamadia (with their spouses, the Mukhiani and Kamadiani), appointed by the Imam. They lead ceremonies, register births and marriages, maintain order and support the Councils."]),
            GuideSection(heading: "Volunteers", symbol: "hand.raised.fill",
                         body: ["Almost all of this work is done by volunteers giving their time as khidmat — from teaching religious education to managing jamatkhanas and responding to emergencies."])
        ],
        sources: [Src.wikiConstitution, Src.cab])
}
