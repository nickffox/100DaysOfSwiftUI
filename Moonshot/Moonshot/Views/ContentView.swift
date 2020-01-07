//
//  ContentView.swift
//  Moonshot
//
//  Created by Nicholas Fox on 1/6/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct ContentView: View {

  let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
  let missions: [Mission] = Bundle.main.decode("missions.json")

  var body: some View {

    NavigationView {
      List(missions) { mission in
        NavigationLink(destination: Text("Detail")) {
          Image(mission.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 44, height: 44)

          VStack(alignment: .leading) {
            Text(mission.displayName)
              .font(.headline)
            Text(mission.formattedLaunchDate)
          }
        }
      }
      .navigationBarTitle("Moonshot")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
