client_pkg =
    'jquery'
    'snapsvg'
    'semantic-ui'

#client_pkg_list = {'js':[],'css':[]}
#for ft in ['js','css']
#    for pkg in client_pkg
#        client_pkg_list[ft].push do
#            expand: true
#            cwd: 'node_modules/' + pkg + '/dist'
#            src: '*.'+ft
#            dest: '../'+ft+'/' + pkg
#client_js = files: client_pkg_list['js']
#client_css = files: client_pkg_list['css']
#
#for ft in ['js','css']
#    for pkg in client_pkg
#        client_pkg_list[ft].push do
#            expand: true
#            cwd: 'node_modules/' + pkg + '/dist'
#            src: '*.'+ft
#            dest: '../'+ft+'/' + pkg
#
client_pkg_list = []
for ft in ['js','css']
    for pkg in client_pkg
        client_pkg_list.push do
            expand: true
            cwd: 'node_modules/' + pkg + '/dist'
            src: '*'
            dest: '../pkg/'+pkg+'/'
client_pkg = files: client_pkg_list

cfg =
    copy:
        pkg: client_pkg
    pug:
        src:
            expand: true
            src: ['*.pug']
            dest: '../'
            ext: '.html'
        options:
            pretty: true
    stylus:
        src:
            expand: true
            src: ['*.styl']
            dest: '../css/'
            ext: '.css'
    livescript:
        src:
            expand: true
            src:
                '*.ls'
                '!Gruntfile.ls'
            dest: '../js/'
            ext: '.js'
        options:
            bare: true

module.exports = (grunt)->
    grunt.initConfig cfg

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-pug'
    grunt.loadNpmTasks 'grunt-contrib-stylus'
    #grunt.loadNpmTasks 'grunt-browserify'
    grunt.loadNpmTasks 'grunt-livescript'

    grunt.registerTask 'default', [
        'pug', 'stylus', 'livescript', 'copy'
    ]

