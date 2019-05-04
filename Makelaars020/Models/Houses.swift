//
//  Houses.swift
//  Makelaars020
//
//  Created by Filip Davidse on 03-05-19.
//  Copyright © 2019 Filip Davidse. All rights reserved.
//


// To parse the JSON, add this file to your project and do:
//
//   let houses = try Houses(json)

import Foundation

struct Houses: Codable {
    let accountStatus: Int?
    let emailNotConfirmed, validationFailed: Bool?
    let validationReport: JSONNull?
    let website: Int?
    let metadata: Metadata?
    let objects: [Object]?
    let paging: Paging?
    let totaalAantalObjecten: Int?
    
    enum CodingKeys: String, CodingKey {
        case accountStatus = "AccountStatus"
        case emailNotConfirmed = "EmailNotConfirmed"
        case validationFailed = "ValidationFailed"
        case validationReport = "ValidationReport"
        case website = "Website"
        case metadata = "Metadata"
        case objects = "Objects"
        case paging = "Paging"
        case totaalAantalObjecten = "TotaalAantalObjecten"
    }
}

struct Metadata: Codable {
    let objectType, omschrijving, titel: String?
    
    enum CodingKeys: String, CodingKey {
        case objectType = "ObjectType"
        case omschrijving = "Omschrijving"
        case titel = "Titel"
    }
}

struct Object: Codable {
    let aangebodenSindsTekst: String?
    let aanmeldDatum: AanmeldDatum?
    let aantalBeschikbaar: JSONNull?
    let aantalKamers: Int?
    let aantalKavels: JSONNull?
    let aanvaarding: String?
    let adres: String?
    let afstand: Int?
    let bronCode: String?
    let childrenObjects: [JSONAny]?
    let datumAanvaarding, datumOndertekeningAkte: String?
    let foto, fotoLarge, fotoLargest, fotoMedium: String?
    let fotoSecure: String?
    let gewijzigdDatum: JSONNull?
    let globalID: Int?
    let groupByObjectType: String?
    let heeft360GradenFoto, heeftBrochure, heeftOpenhuizenTopper, heeftOverbruggingsgrarantie: Bool?
    let heeftPlattegrond, heeftTophuis, heeftVeiling, heeftVideo: Bool?
    let huurPrijsTot, huurprijs, huurprijsFormaat: JSONNull?
    let id: String?
    let inUnitsVanaf: JSONNull?
    let indProjectObjectType: Bool?
    let indTransactieMakelaarTonen: JSONNull?
    let isSearchable, isVerhuurd, isVerkocht, isVerkochtOfVerhuurd: Bool?
    let koopprijs: Int?
    let koopprijsFormaat: String?
    let koopprijsTot, makelaarID: Int?
    let makelaarNaam: String?
    let mobileURL: String?
    let note: JSONNull?
    let openHuis: [String]?
    let oppervlakte: Int?
    let perceeloppervlakte: Int?
    let postcode: String?
    let prijs: Prijs?
    let prijsGeformatteerdHTML, prijsGeformatteerdTextHuur, prijsGeformatteerdTextKoop: String?
    let producten: [Producten]?
    let project: Project?
    let projectNaam: JSONNull?
    let promoLabel: PromoLabel?
    let publicatieDatum: String?
    let publicatieStatus: Int?
    let savedDate: JSONNull?
    let soortAanbod: SoortAanbod?
    let objectSoortAanbod: Int?
    let startOplevering, timeAgoText, transactieAfmeldDatum, transactieMakelaarID: JSONNull?
    let transactieMakelaarNaam: JSONNull?
    let typeProject: Int?
    let url: String?
    let verkoopStatus: VerkoopStatus?
    let wgs84X, wgs84Y: Double?
    let woonOppervlakteTot, woonoppervlakte: Int?
    let woonplaats: Woonplaats?
    let zoekType: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case aangebodenSindsTekst = "AangebodenSindsTekst"
        case aanmeldDatum = "AanmeldDatum"
        case aantalBeschikbaar = "AantalBeschikbaar"
        case aantalKamers = "AantalKamers"
        case aantalKavels = "AantalKavels"
        case aanvaarding = "Aanvaarding"
        case adres = "Adres"
        case afstand = "Afstand"
        case bronCode = "BronCode"
        case childrenObjects = "ChildrenObjects"
        case datumAanvaarding = "DatumAanvaarding"
        case datumOndertekeningAkte = "DatumOndertekeningAkte"
        case foto = "Foto"
        case fotoLarge = "FotoLarge"
        case fotoLargest = "FotoLargest"
        case fotoMedium = "FotoMedium"
        case fotoSecure = "FotoSecure"
        case gewijzigdDatum = "GewijzigdDatum"
        case globalID = "GlobalId"
        case groupByObjectType = "GroupByObjectType"
        case heeft360GradenFoto = "Heeft360GradenFoto"
        case heeftBrochure = "HeeftBrochure"
        case heeftOpenhuizenTopper = "HeeftOpenhuizenTopper"
        case heeftOverbruggingsgrarantie = "HeeftOverbruggingsgrarantie"
        case heeftPlattegrond = "HeeftPlattegrond"
        case heeftTophuis = "HeeftTophuis"
        case heeftVeiling = "HeeftVeiling"
        case heeftVideo = "HeeftVideo"
        case huurPrijsTot = "HuurPrijsTot"
        case huurprijs = "Huurprijs"
        case huurprijsFormaat = "HuurprijsFormaat"
        case id = "Id"
        case inUnitsVanaf = "InUnitsVanaf"
        case indProjectObjectType = "IndProjectObjectType"
        case indTransactieMakelaarTonen = "IndTransactieMakelaarTonen"
        case isSearchable = "IsSearchable"
        case isVerhuurd = "IsVerhuurd"
        case isVerkocht = "IsVerkocht"
        case isVerkochtOfVerhuurd = "IsVerkochtOfVerhuurd"
        case koopprijs = "Koopprijs"
        case koopprijsFormaat = "KoopprijsFormaat"
        case koopprijsTot = "KoopprijsTot"
        case makelaarID = "MakelaarId"
        case makelaarNaam = "MakelaarNaam"
        case mobileURL = "MobileURL"
        case note = "Note"
        case openHuis = "OpenHuis"
        case oppervlakte = "Oppervlakte"
        case perceeloppervlakte = "Perceeloppervlakte"
        case postcode = "Postcode"
        case prijs = "Prijs"
        case prijsGeformatteerdHTML = "PrijsGeformatteerdHtml"
        case prijsGeformatteerdTextHuur = "PrijsGeformatteerdTextHuur"
        case prijsGeformatteerdTextKoop = "PrijsGeformatteerdTextKoop"
        case producten = "Producten"
        case project = "Project"
        case projectNaam = "ProjectNaam"
        case promoLabel = "PromoLabel"
        case publicatieDatum = "PublicatieDatum"
        case publicatieStatus = "PublicatieStatus"
        case savedDate = "SavedDate"
        case soortAanbod = "Soort-aanbod"
        case objectSoortAanbod = "SoortAanbod"
        case startOplevering = "StartOplevering"
        case timeAgoText = "TimeAgoText"
        case transactieAfmeldDatum = "TransactieAfmeldDatum"
        case transactieMakelaarID = "TransactieMakelaarId"
        case transactieMakelaarNaam = "TransactieMakelaarNaam"
        case typeProject = "TypeProject"
        case url = "URL"
        case verkoopStatus = "VerkoopStatus"
        case wgs84X = "WGS84_X"
        case wgs84Y = "WGS84_Y"
        case woonOppervlakteTot = "WoonOppervlakteTot"
        case woonoppervlakte = "Woonoppervlakte"
        case woonplaats = "Woonplaats"
        case zoekType = "ZoekType"
    }
}

enum AanmeldDatum: String, Codable {
    case date12623004000000100 = "/Date(1262300400000+0100)/"
}

struct Prijs: Codable {
    let geenExtraKosten: Bool?
    let huurAbbreviation: String?
    let huurprijs: JSONNull?
    let huurprijsOpAanvraag: String?
    let huurprijsTot: JSONNull?
    let koopAbbreviation: String?
    let koopprijs: Int?
    let koopprijsOpAanvraag: String?
    let koopprijsTot: Int?
    let originelePrijs: JSONNull?
    let veilingText: String?
    
    enum CodingKeys: String, CodingKey {
        case geenExtraKosten = "GeenExtraKosten"
        case huurAbbreviation = "HuurAbbreviation"
        case huurprijs = "Huurprijs"
        case huurprijsOpAanvraag = "HuurprijsOpAanvraag"
        case huurprijsTot = "HuurprijsTot"
        case koopAbbreviation = "KoopAbbreviation"
        case koopprijs = "Koopprijs"
        case koopprijsOpAanvraag = "KoopprijsOpAanvraag"
        case koopprijsTot = "KoopprijsTot"
        case originelePrijs = "OriginelePrijs"
        case veilingText = "VeilingText"
    }
}

enum Producten: String, Codable {
    case brochure = "Brochure"
    case featured = "Featured"
    case plattegrond = "Plattegrond"
    case the360Fotos = "360-fotos"
    case toppositie = "Toppositie"
    case video = "Video"
}

struct Project: Codable {
    let aantalKamersTotEnMet, aantalKamersVan, aantalKavels, adres: JSONNull?
    let friendlyURL, gewijzigdDatum, globalID: JSONNull?
    let hoofdFoto: HoofdFoto?
    let indIpix, indPDF, indPlattegrond, indTop: Bool?
    let indVideo: Bool?
    let internalID: String?
    let maxWoonoppervlakte, minWoonoppervlakte, naam, omschrijving: JSONNull?
    let openHuizen: [JSONAny]?
    let plaats, prijs, prijsGeformatteerd, publicatieDatum: JSONNull?
    let type: Int?
    let woningtypen: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case aantalKamersTotEnMet = "AantalKamersTotEnMet"
        case aantalKamersVan = "AantalKamersVan"
        case aantalKavels = "AantalKavels"
        case adres = "Adres"
        case friendlyURL = "FriendlyUrl"
        case gewijzigdDatum = "GewijzigdDatum"
        case globalID = "GlobalId"
        case hoofdFoto = "HoofdFoto"
        case indIpix = "IndIpix"
        case indPDF = "IndPDF"
        case indPlattegrond = "IndPlattegrond"
        case indTop = "IndTop"
        case indVideo = "IndVideo"
        case internalID = "InternalId"
        case maxWoonoppervlakte = "MaxWoonoppervlakte"
        case minWoonoppervlakte = "MinWoonoppervlakte"
        case naam = "Naam"
        case omschrijving = "Omschrijving"
        case openHuizen = "OpenHuizen"
        case plaats = "Plaats"
        case prijs = "Prijs"
        case prijsGeformatteerd = "PrijsGeformatteerd"
        case publicatieDatum = "PublicatieDatum"
        case type = "Type"
        case woningtypen = "Woningtypen"
    }
}

enum HoofdFoto: String, Codable {
    case imgThumbsThumbGeenFotoGIF = "/img/thumbs/thumb-geen-foto.gif"
}

struct PromoLabel: Codable {
    let hasPromotionLabel: Bool?
    let promotionPhotos: [String]?
    let promotionPhotosSecure: [String]?
    let promotionType, ribbonColor: Int?
    let ribbonText, tagline: String?
    
    enum CodingKeys: String, CodingKey {
        case hasPromotionLabel = "HasPromotionLabel"
        case promotionPhotos = "PromotionPhotos"
        case promotionPhotosSecure = "PromotionPhotosSecure"
        case promotionType = "PromotionType"
        case ribbonColor = "RibbonColor"
        case ribbonText = "RibbonText"
        case tagline = "Tagline"
    }
}

enum SoortAanbod: String, Codable {
    case appartement = "appartement"
    case woonhuis = "woonhuis"
}

enum VerkoopStatus: String, Codable {
    case statusBeschikbaar = "StatusBeschikbaar"
}

enum Woonplaats: String, Codable {
    case amsterdam = "Amsterdam"
}

struct Paging: Codable {
    let aantalPaginas, huidigePagina: Int?
    let volgendeURL: String?
    let vorigeURL: String?
    
    enum CodingKeys: String, CodingKey {
        case aantalPaginas = "AantalPaginas"
        case huidigePagina = "HuidigePagina"
        case volgendeURL = "VolgendeUrl"
        case vorigeURL = "VorigeUrl"
    }
}

// MARK: Convenience initializers and mutators

extension Houses {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Houses.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        accountStatus: Int?? = nil,
        emailNotConfirmed: Bool?? = nil,
        validationFailed: Bool?? = nil,
        validationReport: JSONNull?? = nil,
        website: Int?? = nil,
        metadata: Metadata?? = nil,
        objects: [Object]?? = nil,
        paging: Paging?? = nil,
        totaalAantalObjecten: Int?? = nil
        ) -> Houses {
        return Houses(
            accountStatus: accountStatus ?? self.accountStatus,
            emailNotConfirmed: emailNotConfirmed ?? self.emailNotConfirmed,
            validationFailed: validationFailed ?? self.validationFailed,
            validationReport: validationReport ?? self.validationReport,
            website: website ?? self.website,
            metadata: metadata ?? self.metadata,
            objects: objects ?? self.objects,
            paging: paging ?? self.paging,
            totaalAantalObjecten: totaalAantalObjecten ?? self.totaalAantalObjecten
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Metadata {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Metadata.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        objectType: String?? = nil,
        omschrijving: String?? = nil,
        titel: String?? = nil
        ) -> Metadata {
        return Metadata(
            objectType: objectType ?? self.objectType,
            omschrijving: omschrijving ?? self.omschrijving,
            titel: titel ?? self.titel
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Object {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Object.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        aangebodenSindsTekst: String?? = nil,
        aanmeldDatum: AanmeldDatum?? = nil,
        aantalBeschikbaar: JSONNull?? = nil,
        aantalKamers: Int?? = nil,
        aantalKavels: JSONNull?? = nil,
        aanvaarding: String?? = nil,
        adres: String?? = nil,
        afstand: Int?? = nil,
        bronCode: String?? = nil,
        childrenObjects: [JSONAny]?? = nil,
        datumAanvaarding: String?? = nil,
        datumOndertekeningAkte: String?? = nil,
        foto: String?? = nil,
        fotoLarge: String?? = nil,
        fotoLargest: String?? = nil,
        fotoMedium: String?? = nil,
        fotoSecure: String?? = nil,
        gewijzigdDatum: JSONNull?? = nil,
        globalID: Int?? = nil,
        groupByObjectType: String?? = nil,
        heeft360GradenFoto: Bool?? = nil,
        heeftBrochure: Bool?? = nil,
        heeftOpenhuizenTopper: Bool?? = nil,
        heeftOverbruggingsgrarantie: Bool?? = nil,
        heeftPlattegrond: Bool?? = nil,
        heeftTophuis: Bool?? = nil,
        heeftVeiling: Bool?? = nil,
        heeftVideo: Bool?? = nil,
        huurPrijsTot: JSONNull?? = nil,
        huurprijs: JSONNull?? = nil,
        huurprijsFormaat: JSONNull?? = nil,
        id: String?? = nil,
        inUnitsVanaf: JSONNull?? = nil,
        indProjectObjectType: Bool?? = nil,
        indTransactieMakelaarTonen: JSONNull?? = nil,
        isSearchable: Bool?? = nil,
        isVerhuurd: Bool?? = nil,
        isVerkocht: Bool?? = nil,
        isVerkochtOfVerhuurd: Bool?? = nil,
        koopprijs: Int?? = nil,
        koopprijsFormaat: String?? = nil,
        koopprijsTot: Int?? = nil,
        makelaarID: Int?? = nil,
        makelaarNaam: String?? = nil,
        mobileURL: String?? = nil,
        note: JSONNull?? = nil,
        openHuis: [String]?? = nil,
        oppervlakte: Int?? = nil,
        perceeloppervlakte: Int?? = nil,
        postcode: String?? = nil,
        prijs: Prijs?? = nil,
        prijsGeformatteerdHTML: String?? = nil,
        prijsGeformatteerdTextHuur: String?? = nil,
        prijsGeformatteerdTextKoop: String?? = nil,
        producten: [Producten]?? = nil,
        project: Project?? = nil,
        projectNaam: JSONNull?? = nil,
        promoLabel: PromoLabel?? = nil,
        publicatieDatum: String?? = nil,
        publicatieStatus: Int?? = nil,
        savedDate: JSONNull?? = nil,
        soortAanbod: SoortAanbod?? = nil,
        objectSoortAanbod: Int?? = nil,
        startOplevering: JSONNull?? = nil,
        timeAgoText: JSONNull?? = nil,
        transactieAfmeldDatum: JSONNull?? = nil,
        transactieMakelaarID: JSONNull?? = nil,
        transactieMakelaarNaam: JSONNull?? = nil,
        typeProject: Int?? = nil,
        url: String?? = nil,
        verkoopStatus: VerkoopStatus?? = nil,
        wgs84X: Double?? = nil,
        wgs84Y: Double?? = nil,
        woonOppervlakteTot: Int?? = nil,
        woonoppervlakte: Int?? = nil,
        woonplaats: Woonplaats?? = nil,
        zoekType: [Int]?? = nil
        ) -> Object {
        return Object(
            aangebodenSindsTekst: aangebodenSindsTekst ?? self.aangebodenSindsTekst,
            aanmeldDatum: aanmeldDatum ?? self.aanmeldDatum,
            aantalBeschikbaar: aantalBeschikbaar ?? self.aantalBeschikbaar,
            aantalKamers: aantalKamers ?? self.aantalKamers,
            aantalKavels: aantalKavels ?? self.aantalKavels,
            aanvaarding: aanvaarding ?? self.aanvaarding,
            adres: adres ?? self.adres,
            afstand: afstand ?? self.afstand,
            bronCode: bronCode ?? self.bronCode,
            childrenObjects: childrenObjects ?? self.childrenObjects,
            datumAanvaarding: datumAanvaarding ?? self.datumAanvaarding,
            datumOndertekeningAkte: datumOndertekeningAkte ?? self.datumOndertekeningAkte,
            foto: foto ?? self.foto,
            fotoLarge: fotoLarge ?? self.fotoLarge,
            fotoLargest: fotoLargest ?? self.fotoLargest,
            fotoMedium: fotoMedium ?? self.fotoMedium,
            fotoSecure: fotoSecure ?? self.fotoSecure,
            gewijzigdDatum: gewijzigdDatum ?? self.gewijzigdDatum,
            globalID: globalID ?? self.globalID,
            groupByObjectType: groupByObjectType ?? self.groupByObjectType,
            heeft360GradenFoto: heeft360GradenFoto ?? self.heeft360GradenFoto,
            heeftBrochure: heeftBrochure ?? self.heeftBrochure,
            heeftOpenhuizenTopper: heeftOpenhuizenTopper ?? self.heeftOpenhuizenTopper,
            heeftOverbruggingsgrarantie: heeftOverbruggingsgrarantie ?? self.heeftOverbruggingsgrarantie,
            heeftPlattegrond: heeftPlattegrond ?? self.heeftPlattegrond,
            heeftTophuis: heeftTophuis ?? self.heeftTophuis,
            heeftVeiling: heeftVeiling ?? self.heeftVeiling,
            heeftVideo: heeftVideo ?? self.heeftVideo,
            huurPrijsTot: huurPrijsTot ?? self.huurPrijsTot,
            huurprijs: huurprijs ?? self.huurprijs,
            huurprijsFormaat: huurprijsFormaat ?? self.huurprijsFormaat,
            id: id ?? self.id,
            inUnitsVanaf: inUnitsVanaf ?? self.inUnitsVanaf,
            indProjectObjectType: indProjectObjectType ?? self.indProjectObjectType,
            indTransactieMakelaarTonen: indTransactieMakelaarTonen ?? self.indTransactieMakelaarTonen,
            isSearchable: isSearchable ?? self.isSearchable,
            isVerhuurd: isVerhuurd ?? self.isVerhuurd,
            isVerkocht: isVerkocht ?? self.isVerkocht,
            isVerkochtOfVerhuurd: isVerkochtOfVerhuurd ?? self.isVerkochtOfVerhuurd,
            koopprijs: koopprijs ?? self.koopprijs,
            koopprijsFormaat: koopprijsFormaat ?? self.koopprijsFormaat,
            koopprijsTot: koopprijsTot ?? self.koopprijsTot,
            makelaarID: makelaarID ?? self.makelaarID,
            makelaarNaam: makelaarNaam ?? self.makelaarNaam,
            mobileURL: mobileURL ?? self.mobileURL,
            note: note ?? self.note,
            openHuis: openHuis ?? self.openHuis,
            oppervlakte: oppervlakte ?? self.oppervlakte,
            perceeloppervlakte: perceeloppervlakte ?? self.perceeloppervlakte,
            postcode: postcode ?? self.postcode,
            prijs: prijs ?? self.prijs,
            prijsGeformatteerdHTML: prijsGeformatteerdHTML ?? self.prijsGeformatteerdHTML,
            prijsGeformatteerdTextHuur: prijsGeformatteerdTextHuur ?? self.prijsGeformatteerdTextHuur,
            prijsGeformatteerdTextKoop: prijsGeformatteerdTextKoop ?? self.prijsGeformatteerdTextKoop,
            producten: producten ?? self.producten,
            project: project ?? self.project,
            projectNaam: projectNaam ?? self.projectNaam,
            promoLabel: promoLabel ?? self.promoLabel,
            publicatieDatum: publicatieDatum ?? self.publicatieDatum,
            publicatieStatus: publicatieStatus ?? self.publicatieStatus,
            savedDate: savedDate ?? self.savedDate,
            soortAanbod: soortAanbod ?? self.soortAanbod,
            objectSoortAanbod: objectSoortAanbod ?? self.objectSoortAanbod,
            startOplevering: startOplevering ?? self.startOplevering,
            timeAgoText: timeAgoText ?? self.timeAgoText,
            transactieAfmeldDatum: transactieAfmeldDatum ?? self.transactieAfmeldDatum,
            transactieMakelaarID: transactieMakelaarID ?? self.transactieMakelaarID,
            transactieMakelaarNaam: transactieMakelaarNaam ?? self.transactieMakelaarNaam,
            typeProject: typeProject ?? self.typeProject,
            url: url ?? self.url,
            verkoopStatus: verkoopStatus ?? self.verkoopStatus,
            wgs84X: wgs84X ?? self.wgs84X,
            wgs84Y: wgs84Y ?? self.wgs84Y,
            woonOppervlakteTot: woonOppervlakteTot ?? self.woonOppervlakteTot,
            woonoppervlakte: woonoppervlakte ?? self.woonoppervlakte,
            woonplaats: woonplaats ?? self.woonplaats,
            zoekType: zoekType ?? self.zoekType
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Prijs {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Prijs.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        geenExtraKosten: Bool?? = nil,
        huurAbbreviation: String?? = nil,
        huurprijs: JSONNull?? = nil,
        huurprijsOpAanvraag: String?? = nil,
        huurprijsTot: JSONNull?? = nil,
        koopAbbreviation: String?? = nil,
        koopprijs: Int?? = nil,
        koopprijsOpAanvraag: String?? = nil,
        koopprijsTot: Int?? = nil,
        originelePrijs: JSONNull?? = nil,
        veilingText: String?? = nil
        ) -> Prijs {
        return Prijs(
            geenExtraKosten: geenExtraKosten ?? self.geenExtraKosten,
            huurAbbreviation: huurAbbreviation ?? self.huurAbbreviation,
            huurprijs: huurprijs ?? self.huurprijs,
            huurprijsOpAanvraag: huurprijsOpAanvraag ?? self.huurprijsOpAanvraag,
            huurprijsTot: huurprijsTot ?? self.huurprijsTot,
            koopAbbreviation: koopAbbreviation ?? self.koopAbbreviation,
            koopprijs: koopprijs ?? self.koopprijs,
            koopprijsOpAanvraag: koopprijsOpAanvraag ?? self.koopprijsOpAanvraag,
            koopprijsTot: koopprijsTot ?? self.koopprijsTot,
            originelePrijs: originelePrijs ?? self.originelePrijs,
            veilingText: veilingText ?? self.veilingText
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Project {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Project.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        aantalKamersTotEnMet: JSONNull?? = nil,
        aantalKamersVan: JSONNull?? = nil,
        aantalKavels: JSONNull?? = nil,
        adres: JSONNull?? = nil,
        friendlyURL: JSONNull?? = nil,
        gewijzigdDatum: JSONNull?? = nil,
        globalID: JSONNull?? = nil,
        hoofdFoto: HoofdFoto?? = nil,
        indIpix: Bool?? = nil,
        indPDF: Bool?? = nil,
        indPlattegrond: Bool?? = nil,
        indTop: Bool?? = nil,
        indVideo: Bool?? = nil,
        internalID: String?? = nil,
        maxWoonoppervlakte: JSONNull?? = nil,
        minWoonoppervlakte: JSONNull?? = nil,
        naam: JSONNull?? = nil,
        omschrijving: JSONNull?? = nil,
        openHuizen: [JSONAny]?? = nil,
        plaats: JSONNull?? = nil,
        prijs: JSONNull?? = nil,
        prijsGeformatteerd: JSONNull?? = nil,
        publicatieDatum: JSONNull?? = nil,
        type: Int?? = nil,
        woningtypen: JSONNull?? = nil
        ) -> Project {
        return Project(
            aantalKamersTotEnMet: aantalKamersTotEnMet ?? self.aantalKamersTotEnMet,
            aantalKamersVan: aantalKamersVan ?? self.aantalKamersVan,
            aantalKavels: aantalKavels ?? self.aantalKavels,
            adres: adres ?? self.adres,
            friendlyURL: friendlyURL ?? self.friendlyURL,
            gewijzigdDatum: gewijzigdDatum ?? self.gewijzigdDatum,
            globalID: globalID ?? self.globalID,
            hoofdFoto: hoofdFoto ?? self.hoofdFoto,
            indIpix: indIpix ?? self.indIpix,
            indPDF: indPDF ?? self.indPDF,
            indPlattegrond: indPlattegrond ?? self.indPlattegrond,
            indTop: indTop ?? self.indTop,
            indVideo: indVideo ?? self.indVideo,
            internalID: internalID ?? self.internalID,
            maxWoonoppervlakte: maxWoonoppervlakte ?? self.maxWoonoppervlakte,
            minWoonoppervlakte: minWoonoppervlakte ?? self.minWoonoppervlakte,
            naam: naam ?? self.naam,
            omschrijving: omschrijving ?? self.omschrijving,
            openHuizen: openHuizen ?? self.openHuizen,
            plaats: plaats ?? self.plaats,
            prijs: prijs ?? self.prijs,
            prijsGeformatteerd: prijsGeformatteerd ?? self.prijsGeformatteerd,
            publicatieDatum: publicatieDatum ?? self.publicatieDatum,
            type: type ?? self.type,
            woningtypen: woningtypen ?? self.woningtypen
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension PromoLabel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PromoLabel.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        hasPromotionLabel: Bool?? = nil,
        promotionPhotos: [String]?? = nil,
        promotionPhotosSecure: [String]?? = nil,
        promotionType: Int?? = nil,
        ribbonColor: Int?? = nil,
        ribbonText: String?? = nil,
        tagline: String?? = nil
        ) -> PromoLabel {
        return PromoLabel(
            hasPromotionLabel: hasPromotionLabel ?? self.hasPromotionLabel,
            promotionPhotos: promotionPhotos ?? self.promotionPhotos,
            promotionPhotosSecure: promotionPhotosSecure ?? self.promotionPhotosSecure,
            promotionType: promotionType ?? self.promotionType,
            ribbonColor: ribbonColor ?? self.ribbonColor,
            ribbonText: ribbonText ?? self.ribbonText,
            tagline: tagline ?? self.tagline
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Paging {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Paging.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        aantalPaginas: Int?? = nil,
        huidigePagina: Int?? = nil,
        volgendeURL: String?? = nil,
        vorigeURL: String?? = nil
        ) -> Paging {
        return Paging(
            aantalPaginas: aantalPaginas ?? self.aantalPaginas,
            huidigePagina: huidigePagina ?? self.huidigePagina,
            volgendeURL: volgendeURL ?? self.volgendeURL,
            vorigeURL: vorigeURL ?? self.vorigeURL
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

fileprivate func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

fileprivate func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

