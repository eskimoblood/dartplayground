#import('dart:dom');

class test {

  test() {
  }

  void run() {
    write("Hello World!");
  }

  void write(String message) {
    // the DOM library defines a global "window" variable
    HTMLDocument doc = window.document;
    HTMLParagraphElement p = doc.createElement('p');
    p.textContent = message;
    doc.body.appendChild(p);
  }
}

void main() {
  new test().run();
}
