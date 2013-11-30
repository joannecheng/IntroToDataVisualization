// visualizing what people take in their coffee

Table table;
int rectWidth = 40;
int rectSpacing = 40;
int rectSurround = 10;
int rectHeight = 56;
color coffee = color(22, 13, 16);
color milkCoffee = color(168, 136, 100);

void setup() {
  noStroke();
  smooth();
  size(400, 400);
  background(240, 245, 240);
  boolean sugar = false;

  // http://processing.org/reference/loadTable_.html
  table = loadTable("wwc_survey.csv", "header");

  // traverses through all rows
  int columnNumber = 0;
  int rowNumber = 0;
  for (TableRow row : table.rows()) {
    sugar = false;
    String thingsInCoffee = (row.getString(4));

    if(thingsInCoffee.equals("Milk")){
      fill(milkCoffee);
    }
    else if(thingsInCoffee.equals("Milk, Sugar")) {
      fill(milkCoffee);
      sugar = true;
    }
    else {
      fill(coffee);
    }

    rect((columnNumber*rectWidth + rectSpacing), (rowNumber*rectHeight + rectSpacing), rectWidth-rectSurround, rectHeight-rectSurround);
    if (sugar) {
      drawSugar(columnNumber, rowNumber);
    }
    columnNumber++;

    if(((columnNumber+1)*rectWidth+rectSpacing) > width - rectSpacing) {
      columnNumber = 0;
      rowNumber++;
    }
  }
}

void drawSugar(int columnNumber, int rowNumber) {
  fill(255);
  rect(columnNumber*rectWidth + rectSpacing + (rectWidth-rectSurround)/4, (rowNumber*rectHeight + rectSpacing + 5), 17, 17);
}
