Vim�UnDo� 
��>+�XH��o�ܳ� ���g�c�Y���7��r�              q                       Y��    _�                     
   \    ����                                                                                                                                                                                                                                                                                                                                                             Y��     �   	            \docker run -it -v $PROJ_DIR:/usr/src/app -w /usr/src/app fathomhealth/processing:test pytest       \5�_�                    
   \    ����                                                                                                                                                                                                                                                                                                                                                             Y��     �   	            8docker run -it -v $PROJ_DIR:/usr/src/app -w /usr/src/app   Dfathomhealth/processing:test pytest tests/test_esim_dataprocessor.py5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v       Y��    �                # \�                W# --ignore=tests/fasttext --ignore=tests/fathomairflow --ignore=tests/text_conversion \�                =# --junitxml=/usr/src/app/test_results/pytest/unittests.xml \�                �# && docker run -it -v $PROJ_DIR:/usr/src/app/diseaseTools -w /usr/src/app/diseaseTools fathomhealth/fasttext:test pytest tests/fasttext \�                <# --junitxml=/usr/src/app/test_results/pytest/fasttext.xml \�                �# && docker run -it -v $PROJ_DIR:/usr/src/app/diseaseTools -w /usr/src/app/diseaseTools fathomhealth/text_conversion:test python -m pytest tests/text_conversion \�                C#  --junitxml=/usr/src/app/test_results/pytest/test_conversion.xml 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v       Y�,    �               #5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                 v       Y�4    �   	            }docker run -it -v $PROJ_DIR:/usr/src/app -w /usr/src/app fathomhealth/processing:test pytest tests/test_esim_dataprocessor.py5�_�                    
   q    ����                                                                                                                                                                                                                                                                                                                                                 v       Y�J    �   	            8docker run -it -v $PROJ_DIR:/usr/src/app -w /usr/src/app   Efathomhealth/processing:test pytest tests/test_esim_data_processor.py5�_�                     
   7    ����                                                                                                                                                                                                                                                                                                                                                 v       Y�O    �   	            ~docker run -it -v $PROJ_DIR:/usr/src/app -w /usr/src/app fathomhealth/processing:test pytest tests/test_esim_data_processor.py5��