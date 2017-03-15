class TestPayload
  def test_input
    message = {
        "users_in_photo":[
            {
                "user":{
                    "username":"karlwhiffak",
                    "profile_picture":"https://scontent.cdninstagram.com/t51.2885-19/s150x150/10655046_789876167808614_457818138_a.jpg",
                    "id":"1443333980",
                    "full_name":"Karl Woodrow Mitchell"
                },
                "position":{
                    "y":0.7388477,
                    "x":0.36823854
                }
            }
        ],
        "user_has_liked":false,
        "user":{
            "username":"himynameis_sarah",
            "profile_picture":"https://scontent.cdninstagram.com/t51.2885-19/12940036_1025946850808759_670550570_a.jpg",
            "id":"743467152",
            "full_name":"Sarah Flynt 👑"
        },
        "type":"image",
        "tags":[
            "love",
            "doubletap",
            "edit",
            "quote",
            "instapic",
            "loml",
            "instagood",
            "followforfollow",
            "smile",
            "followback",
            "boyfriend",
            "picoftheday",
            "happy"
        ],
        "location":{},
        "link":"https://www.instagram.com/p/BGKKqSeoadh/",
        "likes":{
            "count":0
        },
        "images":{
            "thumbnail":{
                "width":150,
                "url":"https://scontent.cdninstagram.com/t51.2885-15/s150x150/e35/c236.0.608.608/13277515_994751807299007_1156937301_n.jpg?ig_cache_key=MTI2Mzg2OTUzMTk1NTI0Mjg0OQ%3D%3D.2.c",
                "height":150
            },
            "standard_resolution":{
                "width":640,
                "url":"https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/13381140_104166473340754_1698310139_n.jpg?ig_cache_key=MTI2Mzg2OTUzMTk1NTI0Mjg0OQ%3D%3D.2.l",
                "height":640
            },
            "low_resolution":{
                "width":320,
                "url":"https://scontent.cdninstagram.com/t51.2885-15/s320x320/e35/13381140_104166473340754_1698310139_n.jpg?ig_cache_key=MTI2Mzg2OTUzMTk1NTI0Mjg0OQ%3D%3D.2.l",
                "height":320
            }
        },
        "id":"1263869531955242849_743467152",
        "filter":"Normal",
        "created_time":"1464885010",
        "comments":{
            "count":0
        },
        "caption":{
            "text":"You make me so happy ♥\n#quote #edit #instapic #instagood #picoftheday #love #loml #doubletap #followforfollow #followback #happy #boyfriend #smile @someuser",
            "id":"17848724503074100",
            "from":{
                "username":"himynameis_sarah",
                "profile_picture":"https://scontent.cdninstagram.com/t51.2885-19/12940036_1025946850808759_670550570_a.jpg",
                "id":"743467152",
                "full_name":"Sarah Flynt ��"
            },
            "created_time":"1464885010"
        },
        "attribution":"null"
    }
  end

  def test_output
    message = "{:activity_url=\u003e\"https://www.instagram.com/p/BGKKqSeoadh/\", :author_picture_url=\u003e\"https://scontent.cdninstagram.com/t51.2885-19/12940036_1025946850808759_670550570_a.jpg\", :author_real_name=\u003e\"Sarah Flynt \\xF0\\x9F\\x91\\x91\", :author_username=\u003e\"himynameis_sarah\", :author_id=\u003e\"743467152\", :body_text=\u003e\"You make me so happy \\xE2\\x99\\xA5\\n#quote #edit #instapic #instagood #picoftheday #love #loml #doubletap #followforfollow #followback #happy #boyfriend #smile @someuser\", :id=\u003e\"1263869531955242849_743467152\", :network=\u003e\"instagram\", :post_media=\u003e{:url=\u003e\"https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/13381140_104166473340754_1698310139_n.jpg?ig_cache_key=MTI2Mzg2OTUzMTk1NTI0Mjg0OQ%3D%3D.2.l\", :media_type=\u003e\"image\"}}"

  end
end