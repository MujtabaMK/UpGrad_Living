//
//  SnapCarouselDining.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 30/05/23.
//

import SwiftUI

//To for accepting list
struct SnapCarouselDining<Content: View,T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
        
    //Properties
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    @Binding var changevalue: Bool
        
    init(changeValue: Binding<Bool>,spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>,items: [T], @ViewBuilder content: @escaping (T) -> Content){
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
        self._changevalue = changeValue
    }
    
    // Offset...
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    var body: some View{
        ScrollViewReader { scrollValue in
            GeometryReader{ proxy in
                //Setting correct width for snap carousel...
                
                // One Sided snap caorusel
                let width = proxy.size.width - (trailingSpace - spacing)
                let adjustMentWidth = (trailingSpace / 2) - spacing
                
                HStack(spacing: spacing){
                    ForEach(list){ item in
                        content(item)
                            .frame(width: proxy.size.width - trailingSpace)
                            //.offset(y: getOffset(item: item, width: width))
                    }
                }
                //Spacing will be horizontal padding...
                .padding(.horizontal, spacing)
                .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0) + offset)
                .gesture(
                    DragGesture()
                        .updating($offset, body: { value, out, _ in
                            out = value.translation.width
                        })
                        .onEnded({ value in
                            // Updating Current Index
                            let offsetX = value.translation.width
                            
                            // were going to convert the tranlsation into progress (0 - 1)
                            // and round the value...
                            // based on the progress increasing or dexreasing the current index...
                            
                            let progress = -offsetX / width
                            let roundIndex = progress.rounded()
                            
                            //Setting max...
                            currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 2), 0)
                            
                            //Updating index...
                            currentIndex =  index
                        })
                        .onChanged({ value in
                            //Updating only index...
                            changevalue = false
                            
                            // Updating Current Index
                            let offsetX = value.translation.width
                            
                            // were going to convert the tranlsation into progress (0 - 1)
                            // and round the value...
                            // based on the progress increasing or dexreasing the current index...
                            
                            let progress = -offsetX / width
                            let roundIndex = progress.rounded()
                            
                            //Setting max...
                            index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        })
                )
                .onChange(of: index) { _ in
                    if changevalue{
                        withAnimation {
                            scrollToIndex(index)
                        }
                    }
                }
            }
        }
        .animation(.easeOut, value: offset == 0)
    }
    //Moving View based on scroll offset...
    
    func getOffset(item: T, width: CGFloat) -> CGFloat{
        //Progress
        //Shifting current item to top
        let progress = ((offset < 0 ? offset: -offset) / width) * 60
        let topOffset = -progress < 60 ? progress : -(progress + 120)
        let previous = getIndex(item: item) - 1 == currentIndex ? (offset < 0 ? topOffset : -topOffset) : 0
        let next = getIndex(item: item) + 1 == currentIndex ? (offset < 0 ? -topOffset : topOffset) : 0
        //safty chdck between 0 to max list size
        let checkBetween = currentIndex >= 0 && currentIndex > list.count ? (getIndex(item: item) - 1 == currentIndex ? previous : next) : 0
        //Checking current
        //if sp shifting view to top
        return getIndex(item: item) == currentIndex ? -20 - topOffset : checkBetween
    }
    
    //Fetching Index...
    func getIndex(item: T) -> Int{
        let index = list.firstIndex { currentItem in
            return currentItem.id == item.id
        } ?? 0
        return index
    }
    
    func scrollToIndex(_ index: Int) {
        guard index >= 0 && index < list.count else {
            return // Handle out-of-bounds index
        }
        currentIndex = index
    }
}
