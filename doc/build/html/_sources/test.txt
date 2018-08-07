API文档编写规范
===============
一级标题： =
二级标题： -
三级标题： +
四级标题： ^

API子标题
----------------
二级子标题 '-'

无序列表:

 * Item Foo
 * Item Bar

有序列表:

 #. Item 1
 #. Item 2

API行内标记
-------------
Words can have *emphasis in italics* or be **bold** and you can define
code samples with back quotes, like when you talk about a command: ``sudo``
gives you super user powers!

* 这是一个项目符号列表.
* 它有两项，
  第二项使用两行.

1. 这是个有序列表.
2. 也有两项.

#. 是个有序列表.
#. 也有两项.

* 这是
* 一个列表

  * 嵌套列表
  * 子项

* 父列表继续

.. highlight:: python
   :linenothreshold: 5

.. highlight:: c

.. code-block:: ruby

   Some Ruby code.


.. code-block:: python
  :emphasize-lines: 3,5

  def some_function():
      interesting = False
      print 'This line is highlighted.'
      print 'This one is not...'
      print '...but this one is.'

.. code-block:: c

    int main(){

    }

.. image:: _static/oneoaas_logo.png
   :width: 500
   :height: 500

表格
----------------------

+------------------------+------------+----------+----------+
| Header row, column 1   | Header 2   | Header 3 | Header 4 |
| (header rows optional) |            |          |          |
+========================+============+==========+==========+
| body row 1, column 1   | column 2   | column 3 | column 4 |
+------------------------+------------+----------+----------+
| body row 2             | ...        | ...      |          |
+------------------------+------------+----------+----------+

超链接
----------------------

段落里包含
`a link`_

.. _a link: http://example.com/

百度_

.. _百度: http://www.baidu.com/

`Ubuntu cn`_

.. _`Ubuntu cn`: http://www.ubuntu.org.cn/


评论
-----------------------

.. 这是一个评论.

..
   这整个缩进块都是
   一个评论.

   仍是一个评论.