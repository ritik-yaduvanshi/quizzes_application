class QuestionStore{
  String question;
  String corrAns;
  //QuestionStore({required this.question,required this.corrAns});
  QuestionStore(this.question,this.corrAns);
}

class QuestionBank{
  String subjectName = '';
  int _index  = 0;
  int quesIndex = 0;
  int _questionNumber = 0;
  late int _lastIndex;
  List<QuestionStore> userQuesList = [];
  List<String> list1 = [];
  List<String> list2 = [];
  List<String> list3 = [];
  List<String> list4 = [];

  void setLastIndex(int lastIndex){
    _lastIndex = lastIndex;
  }
  void fillData(String ques,String corrAns,String first,String sec,String third,String four){
    userQuesList.add(QuestionStore(ques,corrAns));
    list1.add(first);
    list2.add(sec);
    list3.add(third);
    list4.add(four);
  }

  void clearQuesAns(){
    userQuesList.clear();
    list1.clear();
    list2.clear();
    list3.clear();
    list4.clear();
    _index = 0;
    _questionNumber = 0;
    quesIndex = 0;
  }

  void update(){
    if(_questionNumber<userQuesList.length){
      _index++;
      quesIndex++;
    }
    getNum(_questionNumber);
  }
  void getNum(int num){
    if(num<_lastIndex){
      _questionNumber = num;
    }
  }


  //getQues
  String getQues(){
    String res = '';
    res = '${userQuesList[_index].question}';
    return res;
  }
  //get Corr ans
  String getCorrAns(){
    String res = '';
    res = '${userQuesList[_index].corrAns}';
    return res;
  }

  String getChoice(String listName){
    String res = '';
    if(listName.compareTo('list1')==0){
      res = '${list1[_index]}';
    }
    else if(listName.compareTo('list2')==0){
      res = '${list2[_index]}';
    }
    else if(listName.compareTo('list3')==0){
      res = '${list3[_index]}';
    }
    else if(listName.compareTo('list4')==0){
      res = '${list4[_index]}';
    }
    return res;
  }

  List<QuestionStoreAll> mainList = [];
  void fillAllValue(String ques,String corrAns,String first,String sec,String third,String four){
    mainList.add(QuestionStoreAll(questions: ques, corrAns: corrAns, firstChoice: first, secondChoice: sec, thirdChoice: third, fourChoice: four));
  }

  String getChoices(String choiceName){
    String res = '';
    if(choiceName.compareTo('corrAns')==0){
      res = mainList[_index].corrAns;
    }else if(choiceName.compareTo('firstChoice')==0){
      res = mainList[_index].firstChoice;
    }else if(choiceName.compareTo('secondChoice')==0){
      res = mainList[_index].secondChoice;
    }else if(choiceName.compareTo('thirdChoice')==0){
      res = mainList[_index].thirdChoice;
    }else if(choiceName.compareTo('fourthChoice')==0){
      res = mainList[_index].fourChoice;
    }
    return res;
  }
  
}

class Sub{
  static String subName='';
  static String userName='';
  void setInfo(String s,String u){
    subName = s;
    userName = u;
  }
  String getSubName(){
    return subName;
  }
  String getUserName(){
    return userName;
  }
}

class QuestionStoreAll{
  String questions;
  String corrAns;
  String firstChoice;
  String secondChoice;
  String thirdChoice;
  String fourChoice;

  QuestionStoreAll({required this.questions,required this.corrAns,required this.firstChoice,
    required this.secondChoice,required this.thirdChoice,required this.fourChoice
  });
}