Vim�UnDo� ����oL���2
�诧�i����f�����  �                                   Y�$�    _�                    2        ����                                                                                                                                                                                                                                                                                                                                                             Y�$e     �  1  2          <<<<<<< HEAD5�_�                   2       ����                                                                                                                                                                                                                                                                                                                                                             Y�$e     �  1  2          )                      method: str = None,5�_�                   2       ����                                                                                                                                                                                                                                                                                                                                                             Y�$e     �  1  2          6                      opts_vals: dict = None) -> None:5�_�                   2        ����                                                                                                                                                                                                                                                                                                                                                             Y�$f     �  1  2          =======5�_�                   4        ����                                                                                                                                                                                                                                                                                                                                                             Y�$g     �  3  4          0>>>>>>> 2f18627e312a66979b332296e9fd9d02530481945�_�                   ;        ����                                                                                                                                                                                                                                                                                                                           ;          L          v���    Y�$�     �  :  <        <<<<<<< HEAD   *    command_lst = ['python3', script_path]       if method is not None:           command_lst += [method]   .    command_lst += ['--{}={}'.format(opt, val)   6                    for opt, val in opts_vals.items()]       try:   ,        stdout = subprocess.run(command_lst,   +                                check=True,   8                                universal_newlines=True,   7                                stdout=subprocess.PIPE,   >                                stderr=subprocess.PIPE).stdout           print(stdout)   .    except subprocess.CalledProcessError as e:           print(e.output)           raise Exception(e)   
    return   =======   O    assert (method is not None and method!=''), "Fire called without a method."5�_�                   O        ����                                                                                                                                                                                                                                                                                                                           ;          ;          v���    Y�$�     �  N  O          0>>>>>>> 2f18627e312a66979b332296e9fd9d02530481945�_�                     �        ����                                                                                                                                                                                                                                                                                                               N         ;          ;          v���    Y�$�    �   �   �           5��