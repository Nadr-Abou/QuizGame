

import SwiftUI

class Cronologia
{
    private var id: Int
    private var orario: String
    private var data: String
    private var voto: Int

    init(id: Int, voto: Int, data: String, orario:String)
    {
        self.id = id
        self.voto = voto
        self.data = data
        self.orario = orario
    }

    var Id: Int
    {
        return self.id
    }

    var Voto: Int
    {
        return self.voto
    }

    var Orario: String
    {
        return self.orario
    }

    var Data: String
    {
        return self.data
    }
}

struct Risultati: View {
    var data: String
    var orario: String
    var immagine: String
    var voto: Int
    
    var body: some View {
        Button(action:{
        }){
            HStack()
            {
                VStack(alignment: .leading, spacing: 5)
                {
                    Text(data).font(.system(size: 20)).foregroundColor(.black)
                    Text(orario).font(.system(size: 20)).foregroundColor(.black)
                }
                
                Spacer()
                Text("\(voto)/30").font(.system(size: 30)).padding(.horizontal, 5).foregroundColor(voto>=18 ? .green: .red)
                Image(systemName: immagine)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .overlay(RoundedRectangle(cornerRadius: 25)
                .stroke(.black, lineWidth: 1.5))
        }
    }
}

struct Sommario: View {
    
    var testo: String
    var totale: Int
    
    var body: some View {
        VStack(spacing: 10)
        {
            Text(testo).font(.system(size: 20)).multilineTextAlignment(.center)
            Text("\(totale)").font(.system(size: 50)).multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(.black, lineWidth: 1.5))
    }
}

struct CronologiaView: View {
    
    var cronologie: [Cronologia] = [
        Cronologia(id: 1, voto: 24, data: "09/10/2023", orario: "9:20"),
        Cronologia(id: 2, voto: 24, data: "09/10/2023", orario: "10:15"),
        Cronologia(id: 3, voto: 15, data: "08/10/2023", orario: "11:30"),
        Cronologia(id: 4, voto: 25, data: "07/10/2023", orario: "10:50"),
        Cronologia(id: 5, voto: 21, data: "06/10/2023", orario: "15:05"),
        Cronologia(id: 6, voto: 30, data: "05/10/2023", orario: "17:17"),
        Cronologia(id: 7, voto: 12, data: "01/10/2023", orario: "10:25"),
        Cronologia(id: 8, voto: 18, data: "01/10/2023", orario: "10:30"),
        Cronologia(id: 9, voto: 22, data: "30/09/2023", orario: "10:40")
        ]
    
    var totaleSimulazioni: Int
    {
        return cronologie.count
    }
    
    func totaleSimulazioniPassate() -> Int
    {
        var contatore: Int = 0
        for dato in cronologie
        {
            if (dato.Voto >= 18)
            {
                contatore = contatore + 1
            }
        }
        
        return contatore
    }

    var body: some View {
        VStack()
        {
            Titolo(titolo: "Cronologia")
            HStack(spacing: 20)
            {
                Sommario(testo: "Simulazioni completate", totale: totaleSimulazioni)
                Sommario(testo: "Simulazioni passate", totale: totaleSimulazioniPassate())
            }
            .padding(15)
            
            VStack(alignment: .center, spacing: 15)
            {
                ScrollView
                {
                    ForEach(cronologie, id: \.Id){ cronologia in
                        Risultati(data: cronologia.Data, orario: cronologia.Orario, immagine: "arrow.right", voto: cronologia.Voto)
                    }
                }
            }.padding(15)
        }
        //MyTabNav()
    }
}

#Preview {
    CronologiaView()
}
