public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
  String lowellHymn = join(loadStrings("LowellHymn.txt"), " "); //puts it into a single string to go thru my breaker program
  ArrayList<String> joa = cleaner(breaker(lowellHymn)); //breaks lowellHymn into arraylist, then cleans it
  String[] joe = new String[joa.size()]; //creates new array the size of the arraylist for lowellHymn
  joe = joa.toArray(joe); //sends the arraylist to joe, becomes array
  for (int i = 0; i < joe.length; i++) {
    System.out.print(pigLatin(joe[i]) + " "); //prints piglatin of the array, with spaces between words
  }
  //perfectly works, tho honestly probably overcomplicated
  //could implement string.split(" ");
}



public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  String joe = sWord.toLowerCase(); //fixes uppercase issues
  for(int i = 0; i < sWord.length(); i++) {
    if (joe.charAt(i) == 'a' || joe.charAt(i) == 'e' || joe.charAt(i) == 'i' || joe.charAt(i) == 'o' || joe.charAt(i) == 'u') {
      return i; //if vowel, return where vowel is
    }
  }
	return -1; //else return -1
}
public String removeStuff(String str) {
    String sNew = new String();
    for(int i = 0; i < str.length(); i++) {
      if (!str.substring(i,i+1).equals(",") && !str.substring(i, i+1).equals(" ") && !str.substring(i, i+1).equals("'") && !str.substring(i, i+1).equals("!") && !str.substring(i,i+1).equals(".")) {
        sNew+=str.substring(i,i+1);
      }
      //checks to see if the character at i is a comma, space, apostrophe, or exclamation point. If not, adds the character to the new string. If is, does nothing with character.
    }
    return sNew;
    //stolen from my palindrome lol
}
public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(sWord) == -1) {
		return removeStuff(sWord) + "ay"; //if no vowel, add ay to end of word
	}
  else if (findFirstVowel(sWord) == 0) {
    return removeStuff(sWord) + "way"; //if begin w/ vowel, add way to end of word
  }
  else if (sWord.substring(0,2).equals("qu")) {
    return removeStuff(sWord).substring(2) + "quay"; //if beginning is qu, remove that and add to end of word with ay.
  }
  else if (findFirstVowel(sWord) != 0) {
    return removeStuff(sWord).substring(findFirstVowel(sWord)) + sWord.substring(0,findFirstVowel(sWord)) + "ay";
    //if vowel but not first, then start after that vowel, then at the end add all consonents before vowel, then add ay.
  }
	else {
		return "ERROR!"; //something failed
	}
  //the removestuff makes sure no spaces or commas when piglatined
}
public ArrayList breaker(String str) {
  ArrayList<String> joe = new ArrayList<String>(); //creates return arraylist
  String fab = ""; //storage list
  for(int i = 0; i < str.length(); i++) {
    if (str.charAt(i) != ',' || str.charAt(i) != '.') { //if not comma or period, proceed. if comma/period, skip it
      fab+=str.substring(i,i+1); //add to storage
      if (str.charAt(i) == ' ') { //if space, end
        fab = removeStuff(fab); //remove weird stuff
        joe.add(fab); //add this guy to the arraylist
        fab = ""; //reset storage
      }
    }
  }
  joe.add(fab); //add final word, as no space at the end
  return joe; //return
}

public ArrayList cleaner(ArrayList joe) {
  ArrayList bob = joe; //copys arraylist
  for (int i = 0; i < bob.size(); i++) {
    if(bob.get(i).equals("")) { //runs thru arraylist, if it finds something not there it removes that spot
      bob.remove(i);
      i--; //goes back to run thru again
    }
  }
  return bob;
}