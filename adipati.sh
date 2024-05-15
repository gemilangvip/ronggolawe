#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYt��  @��x�pW�ڊ����  D  � P @�ͭm��T�M6�hi� ѡ� H�e��=L�##M �4d4 昘�0�   L#4a4�4f�M4   hԆm9i'�W�{�hw�Ǻu�N��^h��[e�z"�~�B��5.������]��Q��y!B��퀁R6<,�1�ѥ�	c��h�[����.`�\�heJ�ĩ��)��0!BL�>,�d��n��{2�p��\��Z�í5ʱ�h퐥����x��a�����^��A��C���5:��҇.��N�I�6���1Q%E����	��
OQ��}բ��3+5
��}��@dMj�B�W�$��R���f1��PBD��#E�Q��,t@��紁�M�F(�I��ѻДi��"R)�2$��O�ҤP��2A9lC�:��@��3�*����Yp��4��ɯ� �T��1gpE��%���E�dE�"�n����]"�ܢ�W��	�2!���1�؏�K���@#�Z:���1��'���)��/��