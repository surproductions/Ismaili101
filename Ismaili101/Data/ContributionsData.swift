import Foundation

// How Ismailis — the Imams, scholars, institutions and community — have contributed to the world.

enum ContributionsData {
    static let all: [ContributionArea] = [
        ContributionArea(title: "Knowledge & learning", symbol: "books.vertical.fill", items: [
            Contribution(title: "Al-Azhar", era: "Fatimid Cairo, 970–972",
                         text: "Founded under the Fatimids as a mosque, al-Azhar grew into one of the world's oldest continuously operating centres of learning."),
            Contribution(title: "The House of Knowledge", era: "Cairo, 1005",
                         text: "Imam al-Hakim's Dar al-'Ilm opened a great library to the public, with teaching in many subjects."),
            Contribution(title: "Philosophy that bridged worlds", era: "10th–11th centuries",
                         text: "Thinkers like al-Sijistani, al-Kirmani and Nasir Khusraw joined Islamic revelation with Greek philosophy, shaping Muslim intellectual history."),
            Contribution(title: "The libraries of Alamut", era: "Persia, 1090–1256",
                         text: "Alamut's famous library drew scholars such as the astronomer Nasir al-Din al-Tusi, who wrote major works while among the Nizaris."),
            Contribution(title: "The Institute of Ismaili Studies", era: "London, 1977",
                         text: "Founded by Aga Khan IV to research and teach Muslim cultures and Ismaili history, and to publish their texts.")
        ]),
        ContributionArea(title: "Cities & architecture", symbol: "building.columns.fill", items: [
            Contribution(title: "Building Cairo", era: "969",
                         text: "The Fatimids founded Cairo, today one of the largest cities in the Middle East and Africa."),
            Contribution(title: "Aga Khan Award for Architecture", era: "Since 1977",
                         text: "One of the world's major architecture prizes, honouring buildings that improve the lives of communities in Muslim societies."),
            Contribution(title: "Saving historic cities", era: "Since the 1990s",
                         text: "The Aga Khan Trust for Culture has restored historic sites from Cairo and Kabul to Delhi, Zanzibar, Mostar and Hunza — creating parks, jobs and pride."),
            Contribution(title: "Ismaili Centres", era: "1985 onward",
                         text: "Landmark buildings in London, Vancouver, Lisbon, Dubai, Dushanbe and Toronto, open to the public for lectures and exhibitions.")
        ]),
        ContributionArea(title: "Statesmanship & diplomacy", symbol: "globe.europe.africa.fill", items: [
            Contribution(title: "League of Nations", era: "1937",
                         text: "Aga Khan III served as President of the League of Nations Assembly, working for international peace."),
            Contribution(title: "Education in South Asia", era: "Early 1900s",
                         text: "Aga Khan III championed modern education for Muslims, including raising funds for the institution that became Aligarh Muslim University, and promoted education for girls."),
            Contribution(title: "Honorary Canadian citizen", era: "2010",
                         text: "Aga Khan IV became only the fifth person ever named an honorary citizen of Canada."),
            Contribution(title: "Seat of the Imamat", era: "Lisbon, 2015",
                         text: "Agreements with governments such as Portugal give the Imamat a formal international role in development and dialogue.")
        ]),
        ContributionArea(title: "Health, education & development", symbol: "cross.case.fill", items: [
            Contribution(title: "Schools since 1905", era: "1905 onward",
                         text: "Aga Khan schools began in Mundra, Gwadar and Zanzibar; today they serve over 110,000 students a year."),
            Contribution(title: "Healthcare for millions", era: "1920s onward",
                         text: "AKDN's health network reaches over 14 million people a year, including in remote mountain valleys."),
            Contribution(title: "Community-led development", era: "Pakistan, 1982",
                         text: "The Aga Khan Rural Support Programme helped villages organise to build their own infrastructure — an approach adopted widely in development."),
            Contribution(title: "Business where others won't invest", era: "Since 1984",
                         text: "AKFED built companies like Roshan in Afghanistan and power plants in Africa, reinvesting profits in development.")
        ]),
        ContributionArea(title: "Arts & culture", symbol: "paintpalette.fill", items: [
            Contribution(title: "Fatimid art", era: "10th–12th centuries",
                         text: "Fatimid rock crystal, ceramics, textiles and woodwork are treasured in museums around the world."),
            Contribution(title: "Poetry", era: "11th century onward",
                         text: "Nasir Khusraw is one of the great poets of the Persian language, and ginans are a rich devotional tradition of South Asia."),
            Contribution(title: "Aga Khan Museum", era: "Toronto, 2014",
                         text: "A museum in Toronto devoted to the arts and cultures of Muslim civilisations, with a park and Ismaili Centre beside it."),
            Contribution(title: "Aga Khan Music Programme", era: "Since 2000",
                         text: "Supports musicians and keeps musical traditions of Central Asia, the Middle East and beyond alive.")
        ]),
        ContributionArea(title: "Pluralism & service", symbol: "person.3.fill", items: [
            Contribution(title: "A diverse Fatimid state", era: "10th–12th centuries",
                         text: "People of different faiths served in the Fatimid government, some at its highest levels."),
            Contribution(title: "Global Centre for Pluralism", era: "Ottawa, 2006",
                         text: "Founded with the Government of Canada to help societies value and manage diversity."),
            Contribution(title: "A culture of volunteering", era: "Today",
                         text: "Ismaili volunteers give their time in education, health, disaster response and community life. AKAH alone has a network of nearly 40,000 local emergency volunteers."),
            Contribution(title: "Refugees who rebuilt", era: "1972 onward",
                         text: "Ismailis expelled from Uganda rebuilt their lives in Canada and beyond; within a year, nearly all were working.")
        ])
    ]
}
