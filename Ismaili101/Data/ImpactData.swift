import Foundation

enum ImpactData {
    // Figures from AKDN / AKU public pages (checked Oct 2026). Update as they change.
    static let metrics: [ImpactMetric] = [
        ImpactMetric(value: 30, prefix: "", suffix: "+", label: "Countries", symbol: "globe.europe.africa.fill",
                     source: "the.akdn — Who we are"),
        ImpactMetric(value: 96, prefix: "", suffix: "K", label: "Employees", symbol: "person.2.fill",
                     source: "the.akdn — Who we are"),
        ImpactMetric(value: 1000, prefix: "", suffix: "+", label: "Programmes & institutions", symbol: "building.2.fill",
                     source: "the.akdn — Who we are"),
        ImpactMetric(value: 2.2, prefix: "", suffix: "M", label: "AKU patients a year", symbol: "cross.case.fill",
                     source: "Aga Khan University overview")
    ]

    static let institutions: [Institution] = [
        Institution(acronym: "AKDN", name: "Aga Khan Development Network", symbol: "network",
                    focus: "Umbrella network",
                    description: "A group of private, non-denominational agencies working to improve quality of life, mostly in Africa and Asia.",
                    highlights: ["Works in over 30 countries", "Serves people of all faiths and backgrounds", "Chaired by the Aga Khan"]),
        Institution(acronym: "AKF", name: "Aga Khan Foundation", symbol: "leaf.fill",
                    focus: "Rural development & civil society",
                    description: "Long-term programmes in agriculture, food security, early childhood development and strengthening local organisations.",
                    highlights: ["Community-led rural development", "Early childhood & education", "Civil society partnerships"]),
        Institution(acronym: "AKHS", name: "Aga Khan Health Services", symbol: "cross.case.fill",
                    focus: "Health",
                    description: "Hospitals, clinics and community health programmes across South and Central Asia and East Africa.",
                    highlights: ["Primary and hospital care", "Maternal and child health", "Community health workers"]),
        Institution(acronym: "AKU", name: "Aga Khan University", symbol: "graduationcap.fill",
                    focus: "Higher education & research",
                    description: "Chartered in Pakistan in 1983, with campuses and teaching hospitals in Asia, Africa and the UK.",
                    highlights: ["Schools of nursing and medicine", "University hospitals in Karachi and Nairobi", "Most students receive financial help"]),
        Institution(acronym: "AKTC", name: "Aga Khan Trust for Culture", symbol: "building.columns.fill",
                    focus: "Culture & heritage",
                    description: "Restores historic sites and uses culture to revitalise communities.",
                    highlights: ["Al-Azhar Park, Cairo — built on a centuries-old rubbish mound", "Restoration of Bagh-e Babur (Babur's Garden), Kabul", "Aga Khan Award for Architecture (est. 1977)", "Aga Khan Music Programme"]),
        Institution(acronym: "AKAM", name: "Aga Khan Agency for Microfinance", symbol: "banknote.fill",
                    focus: "Financial inclusion",
                    description: "Small loans, savings and insurance for people and small businesses that banks often don't reach.",
                    highlights: ["Microloans for small businesses", "Savings and insurance products", "Focus on underserved communities"])
    ]
}
