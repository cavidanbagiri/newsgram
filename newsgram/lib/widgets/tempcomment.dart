

var some = [
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled',
  'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,Lorem Ipsum has been the industrys standard dummy text ever since the 1500sLorem Ipsum has been the industrys standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled',
  'Printer took a galley of type and scrambled',
  'Printer took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambled',
  'Printer took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a ',
  ' scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a ',
  ' galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a ',
  ' galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a ',
  ' a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a ',
  ' of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a galley of type and scrambledPrinter took a ',
];

int total_length = some.length;

int temp_length=0;

int somes(){

  if(total_length > 5)
  {
    temp_length=5;
  }
  else{
    total_length = some.length;
  }
  return temp_length;

}