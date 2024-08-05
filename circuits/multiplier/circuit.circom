pragma circom 2.0.0;

template OurCircuits() {  

  // Signal Input 
    signal input a;
    signal input b;

  // Signal from And Gate :
    signal x;

 // Signal from Not Gate :
    signal y ;    
 
  // Final Signal Output 
  signal output Q;

  // component gate use to create custom circuits 
  component andGate = AND();
  component notGate = NOT();
  component orGate = OR();

  // circuit Logic 

  andGate.a <== a;
  andGate.b <== b;
  x <== andGate.out;

  notGate.in <== b;
  y <== notGate.out;

  orGate.a <== x;
  orGate.b <== y;

  Q <== orGate.out;
  
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

   out <== a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}
template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

component main = OurCircuits();
