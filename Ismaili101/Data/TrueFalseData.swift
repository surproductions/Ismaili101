import Foundation

private func TF(_ statement: String, _ isTrue: Bool, _ explanation: String) -> TrueFalseStatement {
    TrueFalseStatement(statement: statement, isTrue: isTrue, explanation: explanation)
}

enum TrueFalseData {
    static let all: [TrueFalseStatement] = [
        TF("Hazrat Ali was the first Imam.", true, "Ali ibn Abi Talib is the first Imam."),
        TF("The Ismailis are named after Imam Nizar.", false, "They're named after Imam Isma'il. The Nizari branch is named after Nizar."),
        TF("Cairo was founded by the Fatimids in 969.", true, "Under Imam al-Mu'izz."),
        TF("Al-Azhar was originally built as a palace.", false, "It was built as a mosque (970–972) and became a centre of learning."),
        TF("The Dar al-'Ilm was founded by Imam al-Hakim.", true, "In 1005, in Cairo."),
        TF("The title 'Aga Khan' was first granted by the Ottoman Sultan.", false, "It was granted by Fath Ali Shah Qajar of Persia."),
        TF("Aga Khan III presided over the League of Nations Assembly.", true, "In 1937."),
        TF("Aga Khan IV competed in the Summer Olympics as a swimmer.", false, "He skied for Iran at the 1964 Winter Olympics."),
        TF("Prince Rahim Aga Khan V is the 50th Imam.", true, "Since 4 February 2025."),
        TF("The Seat of the Ismaili Imamat is in Lisbon.", true, "Under a 2015 agreement with Portugal."),
        TF("Alamut fell to the Mongols in 1256.", true, "The state ended; the Imamat continued."),
        TF("Nasir Khusraw was born in Cairo.", false, "He was born in Qubadiyan, Central Asia, in 1004."),
        TF("Nasir Khusraw spent about three years in Fatimid Cairo.", true, "During the Imamat of al-Mustansir bi'llah."),
        TF("'Safarnama' means 'Book of Travels'.", true, "Nasir Khusraw's travelogue."),
        TF("Zahir means the inner, spiritual meaning.", false, "Zahir is the outward form; batin is the inner meaning."),
        TF("Ta'wil means leading a form back to its origin or inner meaning.", true, "From a root meaning 'to return to the first'."),
        TF("In classical Ismaili thought, the Universal Soul comes before the Universal Intellect.", false, "The Intellect comes first; the Soul emerges from it."),
        TF("'Aql means intellect.", true, "Intellect or reason."),
        TF("Khidmat means voluntary service.", true, "Service offered for others."),
        TF("AKDN only serves Ismailis.", false, "It serves people regardless of faith, origin or gender."),
        TF("AKDN works in over 30 countries.", true, "Mostly in Africa and Asia."),
        TF("The Aga Khan Museum is in Toronto.", true, "It opened in 2014."),
        TF("Al-Azhar Park in Cairo was built on a former rubbish mound.", true, "A centuries-old debris mound transformed by AKTC."),
        TF("The Aga Khan Award for Architecture began in 1999.", false, "It was established in 1977."),
        TF("Aga Khan University was chartered in Pakistan in 1983.", true, "Headquartered in Karachi."),
        TF("The Fatimid Caliphate was founded in 909 in North Africa.", true, "By Imam al-Mahdi."),
        TF("Imam Husayn was martyred at Karbala in 680.", true, "Remembered on Ashura."),
        TF("Ghadir Khumm took place in 1094.", false, "It took place in 632, as the Prophet returned from his final pilgrimage."),
        TF("Bandagi is a silent meditation practised before dawn.", true, "An inward practice of remembrance."),
        TF("Ginans are devotional hymns from South Asia.", true, "Composed by the pirs."),
        TF("Nass means designation of the next Imam by the current Imam.", true, "That's how succession works."),
        TF("Satr refers to periods when the Imams lived in concealment.", true, "For safety, guiding through teachers."),
        TF("Nasir al-Din al-Tusi worked among the Nizari Ismailis in Persia.", true, "He wrote Akhlaq-i Nasiri there."),
        TF("Pluralism means making everyone the same.", false, "It means valuing diversity as a strength."),
        TF("The Global Centre for Pluralism is in Ottawa.", true, "Founded with the Government of Canada."),
        TF("Aga Khan III led the Imamat for 72 years.", true, "From 1885 to 1957, the longest Imamat."),
        TF("Aga Khan I moved the Imamat's seat from Persia to India.", true, "In the 1840s."),
        TF("Tawhid means the oneness of God.", true, "The foundation of Muslim faith."),
        TF("In Nasir Khusraw's thought, the human soul is already complete in this world.", false, "It comes from a perfect source but is still becoming — like a seed."),
        TF("'Zad al-Musafirin' means 'Provisions for Travellers'.", true, "The soul is the traveller."),
        TF("Imam Mustansir bi'llah II settled at Anjudan.", true, "Beginning the Anjudan revival."),
        TF("The Imamat ended when Alamut fell.", false, "The Imamat continued without break."),
        TF("Ta'yid means divine support granted to the Prophet and the Imams.", true, "It perfects the Imam's understanding."),
        TF("The Qur'an calls natural phenomena 'signs' (ayat).", true, "The same word used for its verses.")
    ]
}
