class Major
  NAME = Hash.new("미분류-이걸 발견하게 되면 운영진에게 알려주세요")
  NAME["KOR"] = "국어국문학"
  NAME["HIS"] = "사학"
  NAME["PHI"] = "철학"
  NAME["REL"] = "종교학"
  NAME["ENG"] = "영미어문"
  NAME["AMC"] = "미국문화"
  NAME["GER"] = "독일문화"
  NAME["FRA"] = "프랑스문화"
  NAME["CHI"] = "중국문화"
  NAME["SOC"] = "사회학"
  NAME["POL"] = "정치외교학"
  NAME["PSY"] = "심리학"
  NAME["LAW"] = "법학"
  NAME["MAT"] = "수학"
  NAME["PHY"] = "물리학"
  NAME["CHM"] = "화학"
  NAME["BIO"] = "생명과학"
  NAME["EEE"] = "전자공학"
  NAME["CSE"] = "컴퓨터공학"
  NAME["CBE"] = "화공생명공학"
  NAME["MEE"] = "기계공학"
  NAME["ECO"] = "경제학"
  NAME["MGT"] = "경영학"
  NAME["COM"] = "신문방송학"
  NAME["GES"] = "여성학"
  NAME["PRT"] = "철학.종교학.신학"
  NAME["MDE"] = "미디어공학"
  NAME["SPM"] = "스포츠경영"
  NAME["JPN"] = "일본학"
  NAME["EDU"] = "교육문화"
  NAME["BNT"] = "바이오융합기술"
  NAME["COS"] = "공통과학"
  NAME["PUB"] = "공공인재"
  NAME["KOS"] = "국제한국학"
  NAME["ANT"] = "아트&테크놀로지"

  #TODO 교양학부 처리
  NAME["LIB"] = "교양학부"
  #  NAME["COR"] = "교양학부"
  #  NAME["CHS"] = "교양학부"
  #  NAME["CHU"] = "교양학부"
  #  NAME["ETS"] = "교양학부"
  #  NAME["ETU"] = "교양학부"
  #  NAME["HFS"] = "교양학부"
  #  NAME["HFU"] = "교양학부"
  #  NAME["HLU"] = "교양학부"
  #  NAME["HSS"] = "교양학부"
  #  NAME["LAU"] = "교양학부"
  #  NAME["LCS"] = "교양학부"
  #  NAME["LCU"] = "교양학부"
  #  NAME["LED"] = "교양학부"
  #  NAME["ROT"] = "교양학부"
  #  NAME["SHS"] = "교양학부"
  #  NAME["SHU"] = "교양학부"
  #  NAME["STS"] = "교양학부"
  #  NAME["STU"] = "교양학부"
  #  NAME["YUC"] = "교양학부"

  #NAME_FOR_OPTIONS = NAME.values.zip(NAME.keys)
  #NAME_FOR_OPTIONS.insert( 0, ["모두","ALL"])

  #TODO grouped selection
  NAME_FOR_OPTIONS = [
      ["모두", "ALL"],
      ["국어국문학", "KOR"],
      ["사학", "HIS"],
      ["철학", "PHI"],
      ["종교학", "REL"],
      ["영미어문", "ENG"],
      ["미국문화", "AMC"],
      ["독일문화", "GER"],
      ["프랑스문화", "FRA"],
      ["중국문화", "CHI"],
      ["사회학", "SOC"],
      ["정치외교학", "POL"],
      ["심리학", "PSY"],
      ["법학", "LAW"],
      ["수학", "MAT"],
      ["물리학", "PHY"],
      ["화학", "CHM"],
      ["생명과학", "BIO"],
      ["전자공학", "EEE"],
      ["컴퓨터공학", "CSE"],
      ["화공생명공학", "CBE"],
      ["기계공학", "MEE"],
      ["경제학", "ECO"],
      ["경영학", "MGT"],
      ["신문방송학", "COM"],
      ["여성학", "GES"],
      ["철학.종교학.신학", "PRT"],
      ["미디어공학", "MDE"],
      ["스포츠경영", "SPM"],
      ["일본학", "JPN"],
      ["교육문화", "EDU"],
      ["바이오융합기술", "BNT"],
      ["교양학부", "LIB"],
      ["공통과학", "COS"],
      ["공공인재", "PUB"],
      ["국제한국학", "KOS"],
      ["아트&테크놀로지", "ANT"],

  ]
end