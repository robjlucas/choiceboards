
var initted = false;
var container = null;
var effectiveWidth;
var width = 200;
var currentlySelected = null;
//https://ssl.gstatic.com/dictionary/static/sounds/oxford/myword--_gb_1.mp3    is an mp3 of the word "myword"   

const choiceBoard = [
    {
        id: "food", 
        word: "Food", 
        sound: "files/food.mp3",
        image: "files/food.jpg",
        // subBoard: [] //insert subboard
    }
    , 
    {
        id: "drink", 
        word: "Drink", 
        sound: "files/drink.mp3",
        image: "files/drink.jpg"
    },
    {
        id: "play", 
        word: "Play", 
        sound: "files/play.mp3",
        image: "files/play.jpg"
    }


];


const itemClicked = function(item, image, coords) {
    console.log("Clicked " + item.id);

    if (currentlySelected == item.id) {
        console.log("Reclicked " + item.id);
        console.log("Transition to child board?");
    }

    navigator.vibrate(200); //miliseconds to vibrate for

    var border = container.append("rect")
        .attr('width', width + 2)
        .attr('height', width + 2)
        .attr("x", coords.x)
        .attr("y", coords.y)
        .attr("fill", "none")
        .attr("stroke", "white")
        .attr("stroke-width", "2px");


    //show text 
    var word = container.append("text")
        .text(item.word)
        .attr("x", coords.x)
        .attr("y", coords.y + width + 30)
        .style("font-size", "28px")
        .attr("fill", "white");


    border.transition().duration(3000).style("opacity", 0).remove();
    word.transition().duration(3000).style("opacity", 0).remove();

    
    __("#" + item.id).stop().start()

    currentlySelected = item.id; 
}

const initBoard = function() {
    var allCoords = produceCoords();
    var i = 0;
    choiceBoard.map(item => {
        var coords = allCoords[i];
        var image = container.append('image')
            .attr('xlink:href', item.image)
            .attr('width', width)
            .attr('height', width)
            .attr("x", coords.x)
            .attr("y", coords.y)
            .on('click', function() {
                itemClicked(item, image, coords);

            });

        i++;
    });
}

const produceCoords = function() {
    return [ // TODO work out somehow
        {x: 50, y: 50},
        {x: 450, y: 50},
        {x: 50, y: 450},
        {x: 450, y: 450}
    ];
}


const initD3 = function() {
        var width = document.body.clientWidth;
        effectiveWidth = width * 0.9;
        var height = document.body.clientHeight;
        if (height < 500) {
            console.log("default height? hmmm")
            height = 500;
        }

        effectiveHeight = height;
        var centre = {x: width/2, y: height/2};

        var svg = d3.select("#screen").append("svg").attr("width",width).attr("height", height);
        var screen = d3.select("#screen");
        screen.style("background", "#010203");

        return svg.append("g");
    };

const initSounds = function() {
    choiceBoard.map(item => {
        __().sampler({id:item.id,path:item.sound}).out(); 

    });
};


const loadBoard = function() {
    // TODO: clear existing board, useful for loading child boards etc. 

    initSounds();    
    initBoard();
}

const init = function() {
    if (initted) {
        return;
    }
    initted = true;


    // TODO load appropritate board, currently hardcoded. 
    loadBoard();
};

container = initD3();       
window.setTimeout(init, 100);

