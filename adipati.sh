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
BZh91AY&SY�O  @��x�pW�ڊ����  D  � P @�ͭh$��dzji�LF�4�� ���h0�D�&���A���M��&��`F�  	�`"������M2    �տD��y�}��R����1���-4�y��P�d9�vg9����ضķ�q/�p�y��ˎr�b��nÚ�X�G�'U�	�H�Z7���Y�D�OP�C*_L�R���)��PE�$��\U�-��h݄��=��V�l�ȩ�U������q� �U��%E��̉�9�g��4�ٙ[7���|]"ouH�[�
�"��䢭��j-^��K<�E+��U(2�F�o��8'��r[㺔cI���Eag!a:A��f��M��+�����=��<Q%�D�q.����$�I�Vm�1�����U��,t��J �נ|貊��&v}r	�<!�o&Y�	L�i
d��&��Mx	=OfF4J�I &qV��0��Q�A�˷������_Ia�ڞ	���I0�����GHj*�f�A��.�p� 7�2�