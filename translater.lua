-- i am not the owner


    --[[
      Message Translator
      Made by Aim, updated by cli
      Credits to Riptxde for the sending chathook
      fixed for krnl by wally#9999
    --]]
    
    if not game['Loaded'] then game['Loaded']:Wait() end; repeat wait(.06) until game:GetService('Players').LocalPlayer ~= nil
    local YourLang = "en" -- Language code that the messages are going to be translated to
    
    local googlev = isfile'googlev.txt' and readfile'googlev.txt' or ''
    
    function googleConsent(Body) -- Because google really said: "Fuck you."
      local args = {}
    
      for match in Body:gmatch('<input type="hidden" name=".-" value=".-">') do
          local k,v = match:match('<input type="hidden" name="(.-)" value="(.-)">')
          args[k] = v
      end
      googlev = args.v
      writefile('googlev.txt', args.v)
    end
    
    local function got(url, Method, Body) -- Basic version of https://www.npmjs.com/package/got using synapse's request API for google websites
      Method = Method or "GET"
     
      local res = request({
          Url = url,
          Method = Method,
          Headers = {cookie="CONSENT=YES+"..googlev},
          Body = Body
      })
     
      if res.Body:match('https://consent.google.com/s') then
          print('consent')
          googleConsent(res.Body)
          res = request({
              Url = url,
              Method = "GET",
              Headers = {cookie="CONSENT=YES+"..googlev}
          })
      end
     
      return res
    end
    
    local languages = {
      auto = "Automatic",
      af = "Afrikaans",
      sq = "Albanian",
      am = "Amharic",
      ar = "Arabic",
      hy = "Armenian",
      az = "Azerbaijani",
      eu = "Basque",
      be = "Belarusian",
      bn = "Bengali",
      bs = "Bosnian",
      bg = "Bulgarian",
      ca = "Catalan",
      ceb = "Cebuano",
      ny = "Chichewa",
      ['zh-cn'] = "Chinese Simplified",
      ['zh-tw'] = "Chinese Traditional",
      co = "Corsican",
      hr = "Croatian",
      cs = "Czech",
      da = "Danish",
      nl = "Dutch",
      en = "English",
      eo = "Esperanto",
      et = "Estonian",
      tl = "Filipino",
      fi = "Finnish",
      fr = "French",
      fy = "Frisian",
      gl = "Galician",
      ka = "Georgian",
      de = "German",
      el = "Greek",
      gu = "Gujarati",
      ht = "Haitian Creole",
      ha = "Hausa",
      haw = "Hawaiian",
      iw = "Hebrew",
      hi = "Hindi",
      hmn = "Hmong",
      hu = "Hungarian",
      is = "Icelandic",
      ig = "Igbo",
      id = "Indonesian",
      ga = "Irish",
      it = "Italian",
      ja = "Japanese",
      jw = "Javanese",
      kn = "Kannada",
      kk = "Kazakh",
      km = "Khmer",
      ko = "Korean",
      ku = "Kurdish (Kurmanji)",
      ky = "Kyrgyz",
      lo = "Lao",
      la = "Latin",
      lv = "Latvian",
      lt = "Lithuanian",
      lb = "Luxembourgish",
      mk = "Macedonian",
      mg = "Malagasy",
      ms = "Malay",
      ml = "Malayalam",
      mt = "Maltese",
      mi = "Maori",
      mr = "Marathi",
      mn = "Mongolian",
      my = "Myanmar (Burmese)",
      ne = "Nepali",
      no = "Norwegian",
      ps = "Pashto",
      fa = "Persian",
      pl = "Polish",
      pt = "Portuguese",
      pa = "Punjabi",
      ro = "Romanian",
      ru = "Russian",
      sm = "Samoan",
      gd = "Scots Gaelic",
      sr = "Serbian",
      st = "Sesotho",
      sn = "Shona",
      sd = "Sindhi",
      si = "Sinhala",
      sk = "Slovak",
      sl = "Slovenian",
      so = "Somali",
      es = "Spanish",
      su = "Sundanese",
      sw = "Swahili",
      sv = "Swedish",
      tg = "Tajik",
      ta = "Tamil",
      te = "Telugu",
      th = "Thai",
      tr = "Turkish",
      uk = "Ukrainian",
      ur = "Urdu",
      uz = "Uzbek",
      vi = "Vietnamese",
      cy = "Welsh",
      xh = "Xhosa",
      yi = "Yiddish",
      yo = "Yoruba",
      zu = "Zulu"
    };
    
    function find(lang)
      for i,v in pairs(languages) do
          if i == lang or v == lang then
              return i
          end
      end
    end
    
    function isSupported(lang)
      local key = find(lang)
      return key and true or false
    end
    
    function getISOCode(lang)
      local key = find(lang)
      return key
    end
    
    function stringifyQuery(dataFields)
      local data = ""
      for k, v in pairs(dataFields) do
          if type(v) == "table" then
              for _,v in pairs(v) do
                  data = data .. ("&%s=%s"):format(
                      game.HttpService:UrlEncode(k),
                      game.HttpService:UrlEncode(v)
                  )
              end
          else
              data = data .. ("&%s=%s"):format(
                  game.HttpService:UrlEncode(k),
                  game.HttpService:UrlEncode(v)
              )
          end
      end
      data = data:sub(2)
      return data
    end
    
    local reqid = math.random(1000,9999)
    local rpcidsTranslate = "MkEWBc"
    local rootURL = "https://translate.google.com/"
    local executeURL = "https://translate.google.com/_/TranslateWebserverUi/data/batchexecute"
    local fsid, bl
    
    do -- init
    print('Api iniciada')
      local InitialReq = got(rootURL)
      fsid = InitialReq.Body:match('"FdrFJe":"(.-)"')
      bl = InitialReq.Body:match('"cfb2h":"(.-)"')
    end
    
    local HttpService = game:GetService("HttpService")
    function jsonE(o)
      return HttpService:JSONEncode(o)
    end
    function jsonD(o)
      return HttpService:JSONDecode(o)
    end
    
    function translate(str, to, from)
      reqid+=10000
      from = from and getISOCode(from) or 'auto'
      to = to and getISOCode(to) or 'en'
    
      local data = {{str, from, to, true}, {nil}}
    
      local freq = {
          {
              {
                  rpcidsTranslate,
                  jsonE(data),
                  nil,
                  "generic"
              }
          }
      }
    
      local url = executeURL..'?'..stringifyQuery{rpcids = rpcidsTranslate, ['f.sid'] = fsid, bl = bl, hl="en", _reqid = reqid-10000, rt = 'c'}
      local body = stringifyQuery{['f.req'] = jsonE(freq)}
     
      local req = got(url, "POST", body)
    
      local body = jsonD(req.Body:match'%[.-%]\n')
      local translationData = jsonD(body[1][3])
      local result = {
          text = "",
          from = {
              language = "",
              text = ""
          },
          raw = ""
      }
      result.raw = translationData
      result.text = translationData[2][1][1][6][1][1]
     
      result.from.language = translationData[3]
      result.from.text = translationData[2][5][1]
    
      return result
    end
    
    local Players = game:GetService("Players")
    local LP = Players.LocalPlayer
    local StarterGui = game:GetService('StarterGui')
  
    local sendEnabled = false
    local target = ""
    
    function translateTo(message, target)
      target = target:lower()
      local translation = translate(message, target, "auto")
    
      return translation.text
    end
    
local a = translateTo("Hola Como Estas", "en")
print(a)
